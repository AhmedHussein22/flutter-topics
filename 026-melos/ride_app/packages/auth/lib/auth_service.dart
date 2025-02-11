class AuthService {
  Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  Future<bool> signup(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }
}
