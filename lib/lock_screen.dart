
import 'package:buzz/register.dart';
import 'package:flutter/material.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
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
                    height: constraints.maxHeight >= 480 ? 400 : 300,
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
                            "Locked",
                            style: TextStyle(
                                fontSize: constraints.maxWidth >= 480 ? 28 : 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Hello Jane, enter your password to unlock the screen!",
                              style: TextStyle(
                                fontSize: constraints.maxWidth >= 480 ? 18 : 15,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                        radius: 30,
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        "Meet anghan",
                                        style: TextStyle(
                                            fontSize:
                                                constraints.maxWidth >= 480
                                                    ? 18
                                                    : 14),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize:
                                          constraints.maxWidth >= 480 ? 16 : 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const SizedBox(
                                  height: 40,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Password",
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
                                  height: 20,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterPage(),
                                          ));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(520, 38),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)))),
                                    child: Text(
                                      "Unlock",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: constraints.maxWidth >= 480
                                              ? 18
                                              : 14),
                                    )),
                                const SizedBox(
                                  height: 18,
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
                                ),
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
