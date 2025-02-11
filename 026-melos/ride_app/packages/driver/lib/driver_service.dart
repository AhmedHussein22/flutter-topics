class DriverService {
  Future<String> fetchDriverData() async {
    await Future.delayed(Duration(seconds: 2));
    return "Driver Data";
  }
}
