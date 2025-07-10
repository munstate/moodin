class SignupModel {
  String nickname = '';
  String email = '';
  String password = '';

  bool isValid() {
    return nickname.isNotEmpty && email.isNotEmpty && password.isNotEmpty;
  }
}
