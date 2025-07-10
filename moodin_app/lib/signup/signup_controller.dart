import 'signup_model.dart';

class SignupController {
  final SignupModel model;
  final Function(String) onError;
  final Function onSuccess;

  SignupController({
    required this.model,
    required this.onError,
    required this.onSuccess,
  });

  void onNicknameChanged(String value) {
    model.nickname = value;
  }

  void onEmailChanged(String value) {
    model.email = value;
  }

  void onPasswordChanged(String value) {
    model.password = value;
  }

  void submit() {
    if (model.isValid()) {
      onSuccess();
    } else {
      onError('모든 필드를 입력해주세요.');
    }
  }
}
