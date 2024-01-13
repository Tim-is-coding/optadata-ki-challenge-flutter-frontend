// ignore_for_file: deprecated_member_use

import 'package:buzz/Widgets/comunpopup.dart';
import 'package:buzz/provider/proviercolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'appstaticdata/staticdata.dart';

class ComunWidget3 extends StatefulWidget {
  const ComunWidget3({Key? key}) : super(key: key);

  @override
  State<ComunWidget3> createState() => _ComunWidget3State();
}

class _ComunWidget3State extends State<ComunWidget3> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifire>(
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire!.getcontiner,
          boxShadow: boxShadow,
        ),
        // height: 100,
        child:  Column(
          children: [
             Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: Row(
                children: [
                  Text("Followers Growth",style: TextStyle( color: notifire!.getMainText,fontSize: 16,fontWeight: FontWeight.bold)),

                  const Expanded(child: SizedBox(width: 200,)),
                  const ComunPopup(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Flexible(
                    child: SizedBox(
                        height: 100,
                        child: SvgPicture.asset("assets/Vector 11.svg",color: appMainColor,fit: BoxFit.fill,)),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox(height: 10,)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Jan",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText)),
                Text("Fab",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText)),
                Text("Mar",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText)),
                Text("Ape",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText)),
                Text("May",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText)),
                Text("Jun",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText)),
                Text("Jul",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText)),
                Text("Aug",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText)),
                Text("Sep",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText)),
                Text("Oct",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText)),
              ],
            ),
            const SizedBox(height: 10,),
          ],
        ),

      ),

    );
  }
}
