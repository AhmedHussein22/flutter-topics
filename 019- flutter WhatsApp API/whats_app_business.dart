import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp/utils/request.dart';
import 'package:whatsapp/whatsapp.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  OtpVerificationScreenState createState() => OtpVerificationScreenState();
}

class OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String? otpInput; // Stores the OTP entered by the user
  String? generatedOtp; // Temporarily stores the OTP

  final WhatsAppService whatsappService = WhatsAppService();

//* Generate a random 6-digit OTP
  void generateOtp() {
    final random = Random();
    final otp = List<int>.generate(6, (_) => random.nextInt(10)).join();
    generatedOtp = otp;
    debugPrint('Generated OTP: $generatedOtp');
  }

//* Handle OTP generation and verification
  void handleGenerateOtp() {
    generateOtp();
    whatsappService.sendOtp('919876543210', generatedOtp!);
  }

//* Verify the OTP entered by the user
  void handleVerifyOtp() {
    if (otpInput == generatedOtp) {
      // OTP is correct
      // Proceed to next step in your app
      debugPrint('OTP is correct');
    } else {
      // Show error message to user
      debugPrint('OTP is Incorrect');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Send OTP")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: handleGenerateOtp,
                child: const Text("Send OTP"),
              ),
              TextField(
                onChanged: (value) => otpInput = value,
                decoration: const InputDecoration(labelText: "Enter OTP"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: handleVerifyOtp,
                child: const Text("Verify OTP"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WhatsAppService {
  final String accessToken = 'EAAGp6aTb8.....'; // Put Your access token
  final String fromNumberId = '1082772452xxxxx'; //Put Your registered WhatsApp Business number ID

  late WhatsApp whatsapp;

  WhatsAppService() {
    whatsapp = WhatsApp(accessToken, fromNumberId);
  }

  Future<void> sendOtp(String userPhoneNumber, String otp) async {
    debugPrint('Sending OTP to $userPhoneNumber');
    try {
      final message = "Your OTP code is: $otp";
      final Request res = await whatsapp.sendMessage(phoneNumber: userPhoneNumber, text: message);
      if (res.isSuccess()) {
        //Return exact API Response Body
        debugPrint('API Response: ${res.getResponse().toString()}');
      } else {
        // Will return HTTP Request error
        debugPrint('Request Error: ${res.getError()}');
        debugPrint('API Response: ${res.getResponse().toString()}');
      }
    } catch (e) {
      debugPrint("Error sending message: $e");
    }
  }
}
