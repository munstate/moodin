class LoginModel {
  String email = '';
  String password = '';
  String nickname = '';

  bool validate() {
    return email.isNotEmpty && password.isNotEmpty;
  }
}
