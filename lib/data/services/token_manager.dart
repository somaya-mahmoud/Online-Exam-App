class TokenManager {
  String? _token;

  String get getToken => _token ?? '';

  set setToken(String token) {
    _token = token;
  }
}
