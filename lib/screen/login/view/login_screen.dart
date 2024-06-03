import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 30, fontFamily: "regular"),
                ),
                const Gap(60),
                Image.asset(
                  "assets/image/clipart.png",
                  height: MediaQuery.sizeOf(context).height * 0.25,
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "Q",
                          style: TextStyle(
                              fontFamily: "semiBold",
                              color: Color(0xff6066D0))),
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
                const Gap(30),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      hintText: "Enter Your Email",
                      hintStyle:
                          TextStyle(fontFamily: "regular", color: Colors.grey),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                const Gap(20),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      hintText: "Passwords",
                      hintStyle:
                          TextStyle(fontFamily: "regular", color: Colors.grey),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                const Gap(40),
                InkWell(
                  onTap: () {
                    Get.toNamed("home");
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.065,
                    width: MediaQuery.sizeOf(context).width * 0.60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xffFCA82F),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: 'regular',
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
                const Gap(150),
                InkWell(
                  onTap: () {
                    Get.toNamed("register");
                  },
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "Don’t have an account?",
                            style: TextStyle(fontFamily: "semiBold")),
                        TextSpan(
                            text: " Register",
                            style: TextStyle(
                                fontFamily: "medium",
                                color: Color(0xff6066D0))),
                      ],
                    ),
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
