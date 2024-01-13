import 'dart:async';

import 'package:get/get.dart';

class ProductPageController extends GetxController implements GetxService{

  List prodectname = [
    "Woman T-shirt",
    "Dream Beauty Fashion",
    "VOXATI",
    "Woman T-shirt",
    "Dream Beauty Fashion",
    "VOXATI",
    "Cyclamen",
    "Woman T-shirt",
    "Dream Beauty Fashion",
    "VOXATI",
    "Cyclamen",
    "Woman T-shirt",
    "Dream Beauty Fashion",
    "Woman T-shirt",
    "VOXATI",
    "Cyclamen",
    "VOXATI",
    "Cyclamen",
  ];

  List prodectdiscription = [
    "Women Full Sleeve Printed Sweatshirt",
    "Tops for Women Stylish",
    "Denim Jacket",
    "Women Full Sleeve Printed Sweatshirt",
    "Tops for Women Stylish",
    "Denim Jacket",
    "Stylish co-ord set 2 piece dress for women",
    "Women Full Sleeve Printed Sweatshirt",
    "Tops for Women Stylish",
    "Denim Jacket",
    "Stylish co-ord set 2 piece dress for women",
    "Women Full Sleeve Printed Sweatshirt",
    "Tops for Women Stylish",
    "Women Full Sleeve Printed Sweatshirt",
    "Denim Jacket",
    "Stylish co-ord set 2 piece dress for women",
    "Denim Jacket",
    "Stylish co-ord set 2 piece dress for women",
  ];

  List prodectprice = [
    "\$26.00",
    "\$56.00",
    "\$56.00",
    "\$16.00",
    "\$26.00",
    "\$23.00",
    "\$22.00",
    "\$16.00",
    "\$25.00",
    "\$36.00",
    "\$26.00",
    "\$95.00",
    "\$36.00",
    "\$76.00",
    "\$46.00",
    "\$27.00",
    "\$24.00",
    "\$13.00",
  ];

  List productimage = [
    "assets/full-length-portrait-happy-excited-girl-bright-colorful-clothes-holding-shopping-bags-while-standing-showing-peace-gesture-isolated.jpg",
    "assets/cheerful-shopaholic-paying-by-mobile-app.jpg",
    "assets/portrait-payment-white-happy-consumer.jpg",
    "assets/portrait-expressive-young-woman-holding-shopping-bags.jpg",
    "assets/cheerful-shopaholic-paying-by-mobile-app.jpg",
    "assets/full-length-portrait-happy-excited-girl-bright-colorful-clothes-holding-shopping-bags-while-standing-showing-peace-gesture-isolated.jpg",
    "assets/cheerful-shopaholic-paying-by-mobile-app.jpg",
    "assets/portrait-payment-white-happy-consumer.jpg",
    "assets/portrait-expressive-young-woman-holding-shopping-bags.jpg",
    "assets/cheerful-shopaholic-paying-by-mobile-app.jpg",
    "assets/full-length-portrait-happy-excited-girl-bright-colorful-clothes-holding-shopping-bags-while-standing-showing-peace-gesture-isolated.jpg",
    "assets/cheerful-shopaholic-paying-by-mobile-app.jpg",
    "assets/portrait-payment-white-happy-consumer.jpg",
    "assets/portrait-expressive-young-woman-holding-shopping-bags.jpg",
    "assets/cheerful-shopaholic-paying-by-mobile-app.jpg",
    "assets/portrait-payment-white-happy-consumer.jpg",
    "assets/portrait-expressive-young-woman-holding-shopping-bags.jpg",
    "assets/cheerful-shopaholic-paying-by-mobile-app.jpg",
  ];

  RxInt gridcounter = 4.obs;


  RxString days = "00".obs;
  RxString hours = "00".obs;
  RxString minutes = "00".obs;
  RxString seconds = "00".obs;


  Timer? countdownTimer;

  Rx<Duration> myDuration =  const Duration(days: 5).obs;

  void startTimer() {
    countdownTimer = Timer.periodic(
        const Duration(seconds: 1), (_) {
        setCountDown();
    });
  }
  void setCountDown() {

    const reduceSecondsBy = 1;

      final seconds1 = myDuration.value.inSeconds - reduceSecondsBy;

      if (seconds1 < 0) {
        // print("  out   am");
        countdownTimer!.cancel();
      } else {
        myDuration.value = Duration(seconds: seconds1);
        days.value    = strDigits(myDuration.value.inDays);
        hours.value   = strDigits(myDuration.value.inHours.remainder(24));
        minutes.value = strDigits(myDuration.value.inMinutes.remainder(60));
        seconds.value = strDigits(myDuration.value.inSeconds.remainder(60));
        // myDuration = Duration(seconds: seconds);
      }

  }


  String strDigits(int n) => n.toString().padLeft(2, '0');

  int selectGride = 4;

  setGride(value){

    selectGride = value;

  }




}