class EnvSecureKeys {
  String get apiKey {
    try {
      return const String.fromEnvironment('apiKey');
    } catch (e) {
      print('Error: $e');
      return '';
    }
  }

  String get googleMapApiKey {
    try {
      return const String.fromEnvironment('googleMapApiKey');
    } catch (e) {
      print('Error: $e');
      return '';
    }
  }
}


