import 'package:flutter/material.dart';
import 'signup_model.dart';
import 'signup_controller.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late final SignupModel _model;
  late final SignupController _controller;

  @override
  void initState() {
    super.initState();
    _model = SignupModel();
    _controller = SignupController(
      model: _model,
      onError: (msg) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg))),
      onSuccess: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('회원가입 완료'))),
    );
  }

  Widget _buildTextField(String label, String hint, bool obscure, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 4),
        TextField(
          obscureText: obscure,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color(0xFFE0E0E0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('mood in', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xFF0077A3))),
              const Text('회원가입', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF3A3A3A))),
              const SizedBox(height: 40),
              _buildTextField('닉네임', '닉네임을 입력하세요', false, _controller.onNicknameChanged),
              _buildTextField('이메일', '이메일을 입력하세요', false, _controller.onEmailChanged),
              _buildTextField('비밀번호', '비밀번호를 입력하세요', true, _controller.onPasswordChanged),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF455A64),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: _controller.submit,
                  child: const Text('회원가입', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('이전', style: TextStyle(color: Colors.black54)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
