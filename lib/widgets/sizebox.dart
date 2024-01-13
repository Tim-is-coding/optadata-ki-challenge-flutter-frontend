import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeBoxx extends StatefulWidget {
  const SizeBoxx({super.key});

  @override
  State<SizeBoxx> createState() => _SizeBoxxState();
}

class _SizeBoxxState extends State<SizeBoxx> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(height: Get.height/25,);
  }
}
