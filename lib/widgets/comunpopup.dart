import 'package:buzz/provider/proviercolors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../appstaticdata/staticdata.dart';

class ComunPopup extends StatefulWidget {
  const ComunPopup({super.key});

  @override
  State<ComunPopup> createState() => _ComunPopupState();
}

class _ComunPopupState extends State<ComunPopup> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifire>(
      builder: (context, value, child) => SizedBox(
        height: 20,
        width: 50,
        child: PopupMenuButton(
          color: notifire!.getprimerycolor,
          shadowColor: Colors.grey.withOpacity(0.5),
          offset: const Offset(-10, 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(0),
          icon:   Icon(Icons.more_horiz_outlined,color: notifire!.getMainText),
          itemBuilder: (ctx) => [
            PopupMenuItem(
                height: 80,
                child:
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    Text('Weekly',style: mediumGreyTextStyle),
                    const SizedBox(height: 8,),
                    Text('Monthly',style: mediumGreyTextStyle),
                    const SizedBox(height: 8,),
                    Text('Yearly',style: mediumGreyTextStyle),
                  ],
                )
            )
          ],),
      ),
    );
  }
}
