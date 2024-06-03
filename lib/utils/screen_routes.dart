import 'package:flutter/material.dart';
import 'package:main_exam/screen/home/view/home_screen.dart';
import 'package:main_exam/screen/login/view/register_screen.dart';
import 'package:main_exam/screen/quiz/view/quiz_screen.dart';
import 'package:main_exam/screen/result/view/result_screen.dart';
import 'package:main_exam/screen/splash/view/splash_screen.dart';
import '../screen/login/view/login_screen.dart';

var screen_routes = <String, WidgetBuilder>{
  '/': (context) => const SplashScreen(),
  'login': (context) => const LoginScreen(),
  'register': (context) => const RegisterScreen(),
  'home': (context) => const HomeScreen(),
  'quiz': (context) => const QuizScreen(),
  'result': (context) => const ResultScreen(),
};
