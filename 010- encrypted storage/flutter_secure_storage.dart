import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static Future<bool> set(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
      return true;
    } catch (e) {
      debugPrint('Error: $e');
      return false;
    }
  }

  static Future<String> get(String key) async {
    try {
      return await _storage.read(key: key) ?? '';
    } catch (e) {
      debugPrint('Error: $e');
      return '';
    }
  }

  static Future<bool> delete(String key) async {
    try {
      await _storage.delete(key: key);
      return true;
    } catch (e) {
      debugPrint('Error: $e');
      return false;
    }
  }

  static Future<bool> deleteAll() async {
    try {
      await _storage.deleteAll();
      return true;
    } catch (e) {
      debugPrint('Error: $e');
      return false;
    }
  }
}
