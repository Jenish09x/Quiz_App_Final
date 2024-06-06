import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:main_exam/screen/home/model/home_model.dart';
import 'package:main_exam/screen/quiz/controller/quiz_controller.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuizController controller = Get.put(QuizController());
  HomeModel h1 = Get.arguments;

  @override
  void initState() {
    super.initState();
    controller.getQuizData(h1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Programming Test",
                  style: TextStyle(
                    fontFamily: 'regular',
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: RoundedProgressBar(
                    percent: controller.index.value as double,
                    height: 30,
                    borderRadius: BorderRadius.circular(50),
                    childRight: Text("${controller.index.value}/10"),
                    style: RoundedProgressBarStyle(
                      borderWidth: 2,
                      colorBorder: const Color(0xff9A9999),
                      colorProgress: const Color(0xffFCA82F),
                      colorProgressDark: Colors.white,
                      backgroundProgress: Colors.white,
                      colorBackgroundIcon: Colors.yellow,
                    ),
                  ),
                ),
                Text(
                  "Question - ${controller.index.value}",
                  style: const TextStyle(
                      fontFamily: 'regular',
                      color: Color(0xff6066D0),
                      fontSize: 20),
                ),
                const Gap(20),
                const Text(
                  "What is part of javascript?",
                  style: TextStyle(fontFamily: 'regular', fontSize: 20),
                ),
                const Gap(20),
                buttonTile(context,
                    "${controller.randomList.value![controller.index.value].option![0]}"),
                const Gap(20),
                buttonTile(context,
                    "${controller.randomList.value![controller.index.value].option![1]}"),
                const Gap(20),
                buttonTile(context,
                    "${controller.randomList.value![controller.index.value].option![2]}"),
                const Gap(20),
                buttonTile(context,
                    "${controller.randomList.value![controller.index.value].option![3]}"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell buttonTile(BuildContext context, String ans) {
    return InkWell(
      onTap: () {
        controller.getResult(ans);
        if (controller.index.value != controller.randomList.value!.length - 1) {
          controller.index++;
        } else {
          print(controller.checkAns.value);
          Get.offAllNamed("result");
        }
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.07,
        width: MediaQuery.sizeOf(context).width * 0.75,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.purple),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          ans,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
