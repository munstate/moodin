import 'package:flutter/material.dart';
import 'login/login_view.dart';
import 'signup/signup_view.dart';
import 'intro/intro_view.dart';
import 'package:provider/provider.dart'; // 꼭 추가
import 'measure/measure_model.dart'; // 모델 경로 확인

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MeasureModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood In',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const IntroView(),
    );
  }
}
