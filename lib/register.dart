
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homepage.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showvalue1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: constraints.maxHeight >= 500 ? 550 : 350,
                      width: constraints.maxWidth >= 480 ? 550 : 350,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              blurStyle: BlurStyle.outer,
                              offset: Offset(1, 4),
                              spreadRadius: 5,
                            )
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: constraints.maxWidth >= 480 ? 30 : 0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Contact information",
                              style: TextStyle(
                                  fontSize:
                                      constraints.maxWidth >= 480 ? 28 : 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Phone*",
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth >= 480
                                            ? 18
                                            : 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    height: 40,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Enter Your Phone",
                                        contentPadding: EdgeInsets.all(8),
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                    "Email*",
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth >= 480
                                            ? 18
                                            : 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    height: 40,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Enter Your Email",
                                        contentPadding: EdgeInsets.all(8),
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                    "password",
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth >= 480
                                            ? 18
                                            : 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    height: 40,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Enter Your password",
                                        contentPadding: EdgeInsets.all(8),
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                    "Username",
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth >= 480
                                            ? 18
                                            : 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    height: 40,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Enter Your Username",
                                        contentPadding: EdgeInsets.all(8),
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        constraints.maxWidth >= 480 ? 18 : 10,
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: showvalue1,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3))),
                                        onChanged: (value) {
                                          setState(() {
                                            showvalue1 = value!;
                                          });
                                        },
                                      ),
                                      const Text(
                                        "By proceeding, you agree to Terms and privacy",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        constraints.maxWidth >= 480 ? 10 : 2,
                                  ),
                                  ElevatedButton(

                                      onPressed: () {

                                       Get.offAll(const HomePage());


                                      },
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(520, 38),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                      child: Text(
                                        "Register",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                constraints.maxWidth >= 480
                                                    ? 18
                                                    : 14),
                                      )),
                                  SizedBox(
                                    height:
                                        constraints.maxWidth >= 480 ? 10 : 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Privacy",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth >= 480
                                            ? 35
                                            : 25,
                                      ),
                                      const Text(
                                        "Terms",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth >= 480
                                            ? 35
                                            : 25,
                                      ),
                                      const Text(
                                        "© 2023 cscodetech",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
