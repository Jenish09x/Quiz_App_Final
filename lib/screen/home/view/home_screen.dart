import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_exam/screen/home/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    // controller.getCategoryData();
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
        body: Center(
          child: ListView.builder(
            itemCount: 6,
            padding: const EdgeInsets.all(10),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: MediaQuery.sizeOf(context).height * 0.15,
                width: MediaQuery.sizeOf(context).width * 0.90,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xff3AD29F),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's Play",
                          style: TextStyle(
                              fontFamily: "semiBold",
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Text(
                          "make your future here",
                          style: TextStyle(
                              fontFamily: "regular", color: Colors.white),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/image/exams.png",
                      height: 100,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
