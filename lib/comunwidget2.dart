// ignore_for_file: deprecated_member_use

import 'package:buzz/Widgets/comunpopup.dart';
import 'package:buzz/provider/proviercolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'appstaticdata/staticdata.dart';

class Comun12 extends StatefulWidget {

  const Comun12({Key? key}) : super(key: key);

  @override
  State<Comun12> createState() => _Comun12State();
}

class _Comun12State extends State<Comun12> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifire>(
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire!.getcontiner,
          boxShadow: boxShadow,
        ),
        height: 100,
        child:   Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: Row(
                children: [
                  Text("Total Users",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText)),

                  const Expanded(child: SizedBox(width: 200,)),

                  const ComunPopup()

                ],
              ),
            ),
            // const Flexible(child: SizedBox(height: 20,)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 89,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xff7366ff).withOpacity(0.1),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: const Color(0xff7366ff),width: 1.5)
                              ),
                              child: Center(child: SvgPicture.asset("assets/user-plus.svg",height: 20,width: 20,color:const Color(0xff7366ff))),
                            ),
                          ),
                          const SizedBox(width: 12,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("178,098",style: mainTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText,overflow: TextOverflow.ellipsis)),
                                const SizedBox(height: 2,),
                                Text(" +30.89",style: mediumGreyTextStyle.copyWith(fontSize: 14,color: const Color(0xff6dc465),overflow:  TextOverflow.ellipsis))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Flexible(child: SizedBox(width: 250,)),
                  Flexible(
                    child: SizedBox(
                      height: 89,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color:  const Color(0xff6dc465).withOpacity(0.1),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: const Color(0xff6dc465),width: 1.5)
                              ),
                              child: Center(child: SvgPicture.asset("assets/user-minus-bottom.svg",height: 20,width: 20,color:const Color(0xff6dc465))),
                            ),
                          ),
                          const SizedBox(width: 12,),

                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("178,098",style: mainTextStyle.copyWith(fontSize: 15,color: notifire!.getMainText,overflow: TextOverflow.ellipsis)),
                                const SizedBox(height: 2,),
                                Text(" +30.89",style:mediumGreyTextStyle.copyWith(fontSize: 13,color: const Color(0xfffc4438),overflow: TextOverflow.ellipsis)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
