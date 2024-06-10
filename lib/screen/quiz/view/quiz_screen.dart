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
        appBar: AppBar(
          title: const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "Q",
                    style: TextStyle(
                        fontFamily: "semiBold", color: Color(0xff6066D0))),
                TextSpan(
                    text: "uiz ",
                    style: TextStyle(
                        fontFamily: "medium", color: Color(0xff535050))),
                TextSpan(
                    text: "App",
                    style: TextStyle(
                        fontFamily: "semiBold", color: Color(0xffFCA82F)))
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.quizList.value == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.randomList.value == null ||
                      controller.randomList.value!.isEmpty
                  ? const Center(
                      child: Text("No Data Available"),
                    )
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Programming Test",
                              style: TextStyle(
                                fontFamily: 'regular',
                                fontSize: 21,
                              ),
                            ),
                            const Gap(30),
                            SizedBox(
                              width: 300,
                              child: Obx(
                                () => RoundedProgressBar(
                                  percent: controller.index.value *
                                      (100 / controller.quizList.value!.length),
                                  height: 30,
                                  borderRadius: BorderRadius.circular(50),
                                  childRight:
                                      Text("${controller.index.value}/10"),
                                  style: RoundedProgressBarStyle(
                                    borderWidth: 2,
                                    colorBorder: const Color(0xff9A9999),
                                    colorProgress: const Color(0xffFCA82F),
                                    colorProgressDark: Colors.transparent,
                                    backgroundProgress: Colors.white,
                                    colorBackgroundIcon: Colors.yellow,
                                  ),
                                ),
                              ),
                            ),
                            const Gap(30),
                            Text(
                              "Question - ${controller.index.value + 1}",
                              style: const TextStyle(
                                  fontFamily: 'regular',
                                  color: Color(0xff6066D0),
                                  fontSize: 20),
                            ),
                            const Gap(10),
                            Text(
                              "${controller.randomList.value![controller.index.value].question}?",
                              style: const TextStyle(
                                  fontFamily: 'regular', fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            const Gap(50),
                            buttonTile(context,
                                "${controller.randomList.value![controller.index.value].option![0]}"),
                            const Gap(10),
                            buttonTile(context,
                                "${controller.randomList.value![controller.index.value].option![1]}"),
                            const Gap(10),
                            buttonTile(context,
                                "${controller.randomList.value![controller.index.value].option![2]}"),
                            const Gap(10),
                            buttonTile(context,
                                "${controller.randomList.value![controller.index.value].option![3]}"),
                          ],
                        ),
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
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          ans,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
