
import 'package:flutter/material.dart';

import 'lock_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {

          return Center(

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: constraints.maxHeight >= 480 ? 400 : 220,
                    width: constraints.maxWidth >= 480 ? 400 : 300,
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
                            "Reset Password",
                            style: TextStyle(
                                fontSize: constraints.maxWidth >= 480 ? 28 : 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 60,
                                  width: double.infinity,
                                  color: Colors.teal[100],
                                  margin: const EdgeInsets.all(8),
                                  child: Center(
                                      child: Text(
                                    "Enter your Email and instructions will be sent to you!",
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth >= 480
                                            ? 14
                                            : 12,
                                        color: Colors.teal,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "Email*",
                                  style: TextStyle(
                                      fontSize:
                                          constraints.maxWidth >= 480 ? 18 : 14,
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
                                        fontSize: 13,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LockScreen(),
                                          ));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(520, 38),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)))),
                                    child: Text(
                                      "Reset",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: constraints.maxWidth >= 480
                                              ? 18
                                              : 14),
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Privacy",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      width:
                                          constraints.maxWidth >= 480 ? 35 : 25,
                                    ),
                                    const Text(
                                      "Terms",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      width:
                                          constraints.maxWidth >= 480 ? 35 : 25,
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
          );
        }));
  }
}
