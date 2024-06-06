import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_exam/screen/home/view/home_screen.dart';
import 'package:main_exam/screen/quiz/controller/quiz_controller.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  QuizController controller = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${controller.checkAns}",
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(onPressed: () {
                Get.off(()=>const HomeScreen(),transition: Transition.downToUp);
              }, child: const Text("Re Play"))
            ],
          ),
        ),
      ),
    );
  }
}
