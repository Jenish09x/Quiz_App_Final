import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed("login"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/image/splash_bg.jpg",
              fit: BoxFit.cover,
            ),
            const Center(
              child: Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 30, color: Colors.white, fontFamily: 'bold'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
