class SetTokenInRequest {
  String? _token;
  static final SetTokenInRequest _instance = SetTokenInRequest._internal();

  factory SetTokenInRequest() {
    return _instance;
  }

  SetTokenInRequest._internal();

  String? get token => _token;

  void setToken(String? token) {
    _token = token;
  }
}
