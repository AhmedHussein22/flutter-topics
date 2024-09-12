import 'dart:developer';

import 'package:flutter/foundation.dart';

class AppLogs {
  AppLogs._();

  static String get _getCurrentTime {
    final DateTime now = DateTime.now();
    return '${now.minute}:${now.second}:${now.millisecond}';
  }

//*Success
  static void successLog(String message, [String tag = 'Success']) {
    if (kDebugMode) {
      log(
        '\x1B[32m$tag ✅✅✅✅✅✅✅✅✅✅✅✅✅:  $message\x1B[0m',
        name: 'Success $_getCurrentTime',
        level: 0,
      );
    }
  }

//*debug
  static void debugLog(String message, [String tag = 'Debug']) {
    if (kDebugMode) {
      log(
        '\x1B[37m$tag 🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛: $message\x1B[0m',
        name: 'Debug $_getCurrentTime',
        level: 1,
      );
    }
  }

//*info
  static void infoLog(String message, [String tag = 'Info']) {
    if (kDebugMode) {
      log(
        '\x1B[33m$tag 📣📣📣📣📣📣📣📣📣📣📣📣📣: $message\x1B[0m',
        name: 'Info $_getCurrentTime',
        level: 2,
      );
    }
  }

  //*error
  static void errorLog(String message, [String tag = 'Error']) {
    if (kDebugMode) {
      log(
        '\x1B[31m$tag ❌❌❌❌❌❌❌❌❌❌❌❌❌: $message\x1B[0m',
        name: 'Error $_getCurrentTime',
        level: 3,
      );
    }
  }
}
