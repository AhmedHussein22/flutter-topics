import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';

class EmailOtpScreen extends StatefulWidget {
  const EmailOtpScreen({super.key});

  @override
  _EmailOtpScreenState createState() => _EmailOtpScreenState();
}

class _EmailOtpScreenState extends State<EmailOtpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String _statusMessage = '';

//* Send OTP to the email entered by the user
  void _sendOtp() async {
    bool result = await EmailOTP.sendOTP(email: _emailController.text);
    setState(() {
      _statusMessage = result ? 'OTP sent successfully!' : 'Failed to send OTP.';
    });
  }

//* Verify the OTP entered by the user
  void _verifyOtp() async {
    bool result = EmailOTP.verifyOTP(otp: _otpController.text);
    setState(() {
      _statusMessage = result ? 'OTP verified successfully!' : 'Invalid OTP.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Enter your email'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _sendOtp,
              child: const Text('Send OTP'),
            ),
            const SizedBox(height: 100.0),
            TextField(
              controller: _otpController,
              decoration: const InputDecoration(labelText: 'Enter OTP'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _verifyOtp,
              child: const Text('Verify OTP'),
            ),
            const SizedBox(height: 16.0),
            Text(_statusMessage),
          ],
        ),
      ),
    );
  }
}
