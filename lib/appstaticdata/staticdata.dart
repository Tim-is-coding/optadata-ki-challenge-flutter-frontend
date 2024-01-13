
import 'package:flutter/material.dart';

import '../provider/proviercolors.dart';




//..............Colors....................

const Color appMainColor = Color(0xff0059E7);
const Color appWhiteColor = Color(0xffffffff);
const Color appGreyColor = Color(0xffa1a1ae);

//..............TextStyle....................

TextStyle mainTextStyle =  const TextStyle(fontSize: 24,fontWeight: FontWeight.w800,color: Colors.black,fontFamily: "Gilroy");
TextStyle mediumGreyTextStyle = const TextStyle(fontSize: 14,color: appGreyColor,fontFamily: "Gilroy");
TextStyle mediumBlackTextStyle = const TextStyle(fontSize: 14,color: Colors.black,fontFamily: "Gilroy");


//..............BoxShadow....................

List<BoxShadow>? boxShadow =  [

];

Decoration boxDecorationn = BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
);


//const value

 const double padding = 15;


// *****************************************
ColorNotifire? notifire;








