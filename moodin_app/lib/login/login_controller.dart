import 'package:flutter/material.dart';
import 'login_model.dart';

class LoginController {
  final LoginModel model;
  final VoidCallback onSuccess;
  final Function(String) onError;

  LoginController({
    required this.model,
    required this.onSuccess,
    required this.onError,
  });

  void onEmailChanged(String value) {
    model.email = value;
  }

  void onPasswordChanged(String value) {
    model.password = value;
  }

  void login() {
    if (model.validate()) {
      // 여기에 실제 로그인 로직을 구현할 수 있습니다.
      onSuccess();
    } else {
      onError("이메일과 비밀번호를 모두 입력해주세요.");
    }
  }
}
