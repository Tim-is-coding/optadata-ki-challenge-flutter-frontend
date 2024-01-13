// ignore_for_file: deprecated_member_use

import 'package:buzz/appstaticdata/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../provider/proviercolors.dart';
import 'chatinfopage.dart';


class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Icon(Icons.arrow_back_ios,color: appGreyColor,size: 18,),
                        )),
                    Expanded(
                      child: ListTile(
                        onTap: () {
                          Get.to(const ChatInfo());
                        },
                        dense: true,
                        leading: const CircleAvatar(radius: 24,backgroundColor: Colors.transparent,backgroundImage: AssetImage("assets/avatar.png")),
                        title: Text("Elon Musk",style: mediumBlackTextStyle.copyWith(color: notifire.getMainText)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("Online",style: mediumBlackTextStyle.copyWith(color: const Color(0xff22C55E)),),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 45,width: 45,decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            ),
                              child: Center(child: SvgPicture.asset("assets/video5.svg",height: 24,width: 24,color: appGreyColor,)),
                            ),
                            const SizedBox(width: 10,),
                            Container(
                              height: 45,width: 45,decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            ),
                              child: Center(child: SvgPicture.asset("assets/phone.svg",height: 24,width: 24,color: appGreyColor,)),
                            ),
                            const SizedBox(width: 10,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.grey.withOpacity(0.3),height: 40,),
                _builchatui(contante: "The exported video seems laggy, what can I do to fix it?"),
                _builchatui1(contante: "Shut down other applications on your laptop to improve the animation."),
                _builchatui(contante: "Can it export in MP4 too?"),
                _builchatui1(contante: "You can convert the .webm files in this video converter from VEED."),
                _builchatui(contante: "Can it export in MP4 too?"),
                _builchatui1(contante: "You can convert the .webm files in this video converter from VEED."),
                _builchatui(contante: "The exported video seems laggy, what can I do to fix it?"),
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    height: 88,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      color: notifire.getbacknoticolor,
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(children: [],),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextField(
                            style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type a Message..",
                              hintStyle: mediumGreyTextStyle,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/image.svg",height: 22,width: 22,color: appGreyColor),
                      const SizedBox(width: 8,),
                      SvgPicture.asset("assets/link-alt.svg",height: 22,width: 22,color: appGreyColor),
                      const SizedBox(width: 8,),
                      SvgPicture.asset("assets/mood-smile.svg",height: 22,width: 22,color: appGreyColor),
                      const Spacer(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100, 40),
                              backgroundColor: appMainColor
                          ),
                          onPressed: () {}, child: Text("Send".tr,style: mediumBlackTextStyle.copyWith(color: appWhiteColor),))
                    ],),
                ),
                const SizedBox(height: 15,),


              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _builchatui({required String contante}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          // height: 160,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12),bottomRight: Radius.circular(12),bottomLeft: Radius.circular(4)),
                            color: notifire.getbacknoticolor,
                          ),
                          child: Center(child: Text(contante,style: mediumGreyTextStyle.copyWith(color: appGreyColor,height: 1.6,letterSpacing: 0.6),)),
                        ),
                      ),
                      const SizedBox(width: 16,),
                      SvgPicture.asset("assets/share-two.svg",height: 22,width: 22,),
                    ],
                  ),
                  const SizedBox(height: 14,),
                  Text("08:23 AM",style: mediumGreyTextStyle,)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(),
          )
        ],
      ),
    );
  }
  Widget _builchatui1({required String contante}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child:  Container(),
          ),
          Expanded(
            flex: 5,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/share-two.svg",height: 22,width: 22,),
                      const SizedBox(width: 16,),
                      Expanded(
                        child: Container(
                          // height: 160,
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12),bottomRight: Radius.circular(4),bottomLeft: Radius.circular(12)),
                            color: appMainColor,
                          ),
                          child: Center(child: Text(contante,style: mediumBlackTextStyle.copyWith(color: Colors.white,height: 1.6,letterSpacing: 0.6),)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14,),
                  Text("08:23 AM",style: mediumGreyTextStyle,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
