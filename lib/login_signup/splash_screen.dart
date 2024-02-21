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

    Future.delayed(
      const Duration(seconds: 2),
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
              SvgPicture.network(
                "https://upload.wikimedia.org/wikipedia/commons/5/5b/Opta_Data_Gruppe_logo_(2021).svg",
                height: 200,
                width: 200,
              ),
              const SizedBox(
                width: 12,
              ),
              const Text(
                "Opta Data KI Challenge",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ],
          )
        ],
      ),
    );
  }
}
