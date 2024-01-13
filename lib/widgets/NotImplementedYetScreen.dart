import 'package:buzz/Widgets/comuntitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class NotImplementedYetScreen extends StatelessWidget {
  String title;

  NotImplementedYetScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
            child: Column(children: [
          ComunTitle(title: title, path: "Abrechnung"),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              SvgPicture.asset(
                "assets/saniup.svg",
                width: 120,
              ),
              const SizedBox(height: 20),
              const Text("Noch nicht implementiert")
            ],
          ))
        ])));
  }
}
