class ClientService {
  Future<String> fetchClientData() async {
    await Future.delayed(Duration(seconds: 2));
    return "Client Data";
  }
}
