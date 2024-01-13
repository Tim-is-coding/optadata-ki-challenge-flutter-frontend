
import 'package:buzz/register.dart';
import 'package:buzz/reset_password.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white38,
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
                      height: constraints.maxHeight >= 500 ? 520 : 300,
                      width: constraints.maxWidth >= 480 ? 520 : 300,
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
                              "Sing in",
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
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "We suggest using the email address you use at work.",
                                style: TextStyle(
                                  fontSize:
                                      constraints.maxWidth >= 480 ? 18 : 15,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
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
                                    height: 25,
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
                                        "Sing in",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                constraints.maxWidth >= 480
                                                    ? 18
                                                    : 14),
                                      )),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.lock,
                                        color: Colors.blue,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ResetPassword(),
                                                ));
                                          },
                                          child: Text(
                                            "Forgot your password",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize:
                                                    constraints.maxWidth >= 480
                                                        ? 14
                                                        : 12,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  ),
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
