import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../appstaticdata/staticdata.dart';
import '../provider/proviercolors.dart';

class ComunTextField extends StatefulWidget {
  
 final String title;
 final  String hinttext;
 final TextEditingController controller;
 final String? img;
 final Widget? prefix;

   const ComunTextField({Key? key, required this.title, required this.hinttext, required this.controller, this.img,this.prefix}) : super(key: key);

  @override
  State<ComunTextField> createState() => _ComunTextFieldState();
}

class _ComunTextFieldState extends State<ComunTextField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifire>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,style:  mediumBlackTextStyle.copyWith(color: notifire!.getMainText),),
            const SizedBox(height: 10,),
            SizedBox(
              child: TextFormField(
                style: TextStyle(color: notifire!.getMainText),
                enabled: true,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration:  InputDecoration(
                    hintStyle: mediumGreyTextStyle.copyWith(fontSize: 13),
                    hintText: widget.hinttext,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    border:  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.withOpacity(0.3)),
                        borderRadius: const BorderRadius.all(Radius.circular(10))
                    ),
                    // contentPadding: widget.prefix!=null?  EdgeInsets.symmetric(vertical: 10,horizontal: 10):EdgeInsets.zero,
                ),
                controller: widget.controller,
              ),
            ),
          ],
        );
      },
    );
  }
}
