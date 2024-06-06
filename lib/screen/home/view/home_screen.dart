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
    controller.getCategoryData();
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
          () => Center(
            child: Column(
              children: [
                Container(
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
                ),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.90,
                    child: const Divider()),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.categoryList.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed("quiz",
                              arguments: controller.categoryList[index]);
                        },
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.17,
                          width: MediaQuery.sizeOf(context).width * 0.90,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              // color: controller.randomColor(),
                              gradient: LinearGradient(
                                  colors: [
                                    controller.randomColor(),
                                    controller.randomColor(),
                                    controller.randomColor(),
                                    // controller.randomColor(),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${controller.categoryList[index].category}",
                                    style: const TextStyle(
                                        fontFamily: "semiBold",
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                  const Text(
                                    "10 question",
                                    style: TextStyle(
                                        fontFamily: "regular",
                                        color: Colors.white,
                                        fontSize: 17),
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        "assets/image/book-stack 1.png",
                                        height: 70,
                                      ),
                                      const Text(
                                        "\$500",
                                        style: TextStyle(
                                            fontFamily: 'semiBold',
                                            color: Colors.white,
                                            fontSize: 17),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.grey.shade200,
                              ),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "entry people - 200 seats",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
