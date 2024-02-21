// ignore_for_file: prefer_const_constructors


import 'package:buzz/homepage.dart';
import 'package:get/get.dart';

import '../login_signup/splash_screen.dart';


class Routes {
  static String initial = "/";
  static String homepage = "/homePage";
}

final getPage = [
  GetPage(
    name: Routes.initial,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: Routes.homepage,
    page: () => OpdaDataChallenge(),
  ),
];
