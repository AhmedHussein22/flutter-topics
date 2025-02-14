import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_topics_app/flutter_topic_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EmailOTP.config(
    appName: 'OTP Testing App', // your app name
    otpType: OTPType.numeric, // or OTPType.alphaNumeric
    expiry: 1200000, // expiry duration in milliseconds (2 minutes)
    emailTheme: EmailTheme.v6, // or EmailTheme.v5
    appEmail: 'ahmed.dev229@gmail.com', // your email
    otpLength: 6,
  );
  runApp(const FlutterTopicApp());
}
