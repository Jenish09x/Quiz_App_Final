import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:main_exam/screen/login/view/login_screen.dart';
import 'package:main_exam/utils/api_helper.dart';
import 'package:main_exam/utils/shared_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

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
                "Register",
                style: TextStyle(fontSize: 30, fontFamily: "regular"),
              ),
              const Gap(40),
              Image.asset(
                "assets/image/Sign up-rafiki.png",
                height: MediaQuery.sizeOf(context).height * 0.30,
              ),
              const Text.rich(
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
              const Gap(30),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: txtName,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "Enter Your Full Name",
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
                  controller: txtEmail,
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
                  controller: txtPassword,
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
                onTap: () async {
                  final res = await ApiHelper.apiHelper.registerData(
                    txtName.text,
                    txtEmail.text,
                    txtPassword.text,
                  );
                  ShareHelper.shr.setRegister(txtEmail.text, txtPassword.text);
                  Get.off(()=>const LoginScreen(),transition: Transition.fade);
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
                    "Register",
                    style: TextStyle(
                        fontFamily: 'regular',
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
              const Gap(100),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "if you have already account?",
                          style: TextStyle(fontFamily: "semiBold")),
                      TextSpan(
                          text: "  click here",
                          style: TextStyle(
                              fontFamily: "medium", color: Color(0xff6066D0))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
