import 'package:flutter/material.dart';
import 'login_model.dart';
import 'login_controller.dart';
import 'package:moodin_app/home/home_view.dart';
import 'package:moodin_app/signup/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginModel _model;
  late final LoginController _controller;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
void initState() {
  super.initState();
  _model = LoginModel();
  _controller = LoginController(
    model: _model,
    onSuccess: () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('로그인 성공')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(username: _model.nickname),
        ),
      );
    },
    onError: (msg) => ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFAFAFAFA),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'mood in',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xFF0077A3)),
              ),
              const Text(
                '로그인',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF3A3A3A)),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: '이메일'),
                onChanged: _controller.onEmailChanged,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: '비밀번호'),
                onChanged: _controller.onPasswordChanged,
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerRight,
                child: Text('아이디 / 비밀번호 찾기'),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('계정이 없으신가요?'),
                  const SizedBox(width: 4),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignupView()),
                      );
                    },
                    child: const Text(
                      '회원가입',
                      style: TextStyle(color: Color(0xFF29A9E0)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6DD3F9),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: _controller.login,
                  child: const Text(
                    '로그인',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
