// ignore_for_file: deprecated_member_use


import 'package:buzz/provider/proviercolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'appstaticdata/staticdata.dart';

class ComunTile1 extends StatefulWidget {
  final String name;
  final String price;
  final String trailing;
  final Color color;
  final String icon;
  const ComunTile1({Key? key, required this.name, required this.price, required this.trailing, required this.color, required this.icon}) : super(key: key);

  @override
  State<ComunTile1> createState() => _ComunTile1State();
}

class _ComunTile1State extends State<ComunTile1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifire>(
      builder: (context, value, child) => Padding(
        padding:  const EdgeInsets.all(padding),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: notifire!.getcontiner,
            boxShadow: boxShadow,
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color:widget.color),
                  ),
                  child: Center(child:SvgPicture.asset( widget.icon,color:  widget.color,height: 25,width: 25))
                  ,
                ),
                title: Text( widget.price,style: mainTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1),
                subtitle: Text( widget.name,style: mediumGreyTextStyle,),
                trailing: Text( widget.trailing,style: mediumGreyTextStyle.copyWith(color: widget.color),),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
