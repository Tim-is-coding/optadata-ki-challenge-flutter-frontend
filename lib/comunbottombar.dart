
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'appstaticdata/staticdata.dart';
import 'provider/proviercolors.dart';

class ComunBottomBar extends StatefulWidget {
  const ComunBottomBar({Key? key}) : super(key: key);

  @override
  State<ComunBottomBar> createState() => _ComunBottomBarState();
}

class _ComunBottomBarState extends State<ComunBottomBar> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<ColorNotifire>(
      builder: (BuildContext context, value, Widget? child) {
        return  Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              boxShadow: boxShadow,
              color: notifire!.getprimerycolor
          ),
          child:  Center(child: Text("Copyright 2023 © Buzz.",style: TextStyle(color: notifire!.getMainText),)),
        );
      },
    );
  }
}
