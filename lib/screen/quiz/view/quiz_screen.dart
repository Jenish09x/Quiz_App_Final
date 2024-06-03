import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            child: Obx(
              () => controller.quizList.value == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${controller.randomList.value![controller.index.value].question}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
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
          style: TextStyle(overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
