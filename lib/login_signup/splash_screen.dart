import 'package:buzz/appstaticdata/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var selected = 0;

  @override
  initState() {
    super.initState();

    // TODO load data here
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed(Routes.homepage);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/saniup.svg",
                height: 50,
                width: 50,
              ),
              const SizedBox(
                width: 12,
              ),
              const Text(
                "SaniUp",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ],
          )
        ],
      ),
    );
  }
}
