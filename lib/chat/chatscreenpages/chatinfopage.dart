// ignore_for_file: deprecated_member_use

import 'package:buzz/provider/proviercolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../appstaticdata/staticdata.dart';



class ChatInfo extends StatefulWidget {
  const ChatInfo({super.key});

  @override
  State<ChatInfo> createState() => _ChatInfoState();
}

class _ChatInfoState extends State<ChatInfo> {
  ColorNotifire notifire = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: notifire.getbgcolor,
        body: Container(
          // height: 700,
          decoration: BoxDecoration(
              // border: Border.all(color: Colors.grey.withOpacity(0.3)),
              color: notifire.getcontiner
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back_ios,size: 18,color: appGreyColor,)),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 45,width: 45,decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.withOpacity(0.3)),
                          ),
                            child: Center(child: SvgPicture.asset("assets/plus.svg",height: 24,width: 24,)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const CircleAvatar(radius: 70,backgroundColor: Colors.transparent,backgroundImage: AssetImage("assets/avatar1.png"),),
                    const SizedBox(height: 20,),
                    Text("Elon Musk",style: mainTextStyle.copyWith(color: notifire.getTextColor1),),
                    const SizedBox(height: 8,),
                    Text("Flutter Dev.",style: mediumBlackTextStyle.copyWith(color: appGreyColor),),
                    const SizedBox(height: 50),
                    ListTile(
                      title: Text("Recent files",style: mediumBlackTextStyle.copyWith(color: notifire.getMainText)),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text("123 files",style: mediumGreyTextStyle,),
                      ),
                      trailing: SizedBox(
                          height: 20,
                          width: 20,
                          child: Center(child: SvgPicture.asset("assets/chevron-down.svg",height: 20,width: 20,))),
                    ),
                    const SizedBox(height: 16,),
                    ListTile(
                      title: Text("InvoiceXX.pdf",style: mediumGreyTextStyle),
                      leading: SizedBox(height: 22,width: 22,child: SvgPicture.asset("assets/receipt.svg",color: appGreyColor,)),
                      trailing: SizedBox(height: 22,width: 22,child: SvgPicture.asset("assets/dots-h.svg",color: appGreyColor,)),
                    ),
                    ListTile(
                      title: Text("InvoiceZZ.pdf",style: mediumGreyTextStyle),
                      leading: SizedBox(height: 22,width: 22,child: SvgPicture.asset("assets/receipt.svg",color: appGreyColor,)),
                      trailing: SizedBox(height: 22,width: 22,child: SvgPicture.asset("assets/dots-h.svg",color: appGreyColor,)),
                    ),
                    ListTile(
                      title: Text("Document.docx",style: mediumGreyTextStyle),
                      leading: SizedBox(height: 22,width: 22,child: SvgPicture.asset("assets/file-text.svg",color: appGreyColor,)),
                      trailing: SizedBox(height: 22,width: 22,child: SvgPicture.asset("assets/dots-h.svg",color: appGreyColor,)),
                    ),
                    const SizedBox(height: 30,),
                    ListTile(
                      title: Text("Images",style: mediumBlackTextStyle.copyWith(color: notifire.getMainText)),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text("29 Images",style: mediumGreyTextStyle,),
                      ),
                      trailing: SizedBox(
                          height: 20,
                          width: 20,
                          child: Center(child: SvgPicture.asset("assets/chevron-down.svg",height: 20,width: 20,))),
                    ),
                    const SizedBox(height: 10,),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 150,
                            // width: 112,
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: const DecorationImage(image: AssetImage("assets/image01.png"),fit: BoxFit.cover)
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            height: 150,
                            // width: 112,
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: const DecorationImage(image: AssetImage("assets/pexels-boys-in-bristol-photography-10528234.jpg"),fit: BoxFit.cover)
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 150,
                            // width: 112,
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: const DecorationImage(image: AssetImage("assets/pexels-davide-de-giovanni-2340978.jpg"),fit: BoxFit.cover)
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            height: 150,
                            // width: 112,
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: const DecorationImage(image: AssetImage("assets/pexels-kelvin-valerio-810775.jpg"),fit: BoxFit.cover)
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),

                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
