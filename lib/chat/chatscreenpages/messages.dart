// ignore_for_file: deprecated_member_use

import 'package:buzz/appstaticdata/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Widgets/comuntitle.dart';
import '../../Widgets/sizebox.dart';
import '../../comunbottombar.dart';
import '../../controllerss/messagescontroller.dart';
import '../../provider/proviercolors.dart';
import 'chatboxpage.dart';




class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  MassageController massageController = Get.put(MassageController());
  ColorNotifire notifire = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return GetBuilder<MassageController>(
      builder: (massageController) {
        return LayoutBuilder(builder: (context, constraints) {
          if(constraints.maxWidth<800){
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: notifire.getbgcolor,
              child:  SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    children: [
                      const ComunTitle(title: 'Chat',path: "App"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: padding),
                        child: _buildui1(width: constraints.maxWidth),
                      ),
                      const SizeBoxx(),
                      const ComunBottomBar(),
                    ]
                  ),
                ),
              );
            }else if(constraints.maxWidth<1200){
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: notifire.getbgcolor,
              child:  SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    children: [
                      const ComunTitle(title: 'Chat',path: "App"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: padding),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: _buildui1(width: constraints.maxWidth),
                            ),
                            Expanded(
                              flex: 2,
                              child: _buildui2(width: constraints.maxWidth),
                            ),
                          ],
                        ),
                      ),
                      const SizeBoxx(),
                      const ComunBottomBar(),
                ]),
              ),

            );
          }else{
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: notifire.getbgcolor,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    children: [
                      const ComunTitle(title: 'Chat',path: "App"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: _buildui1(width: constraints.maxWidth),
                            ),
                            Expanded(
                              flex: 2,
                              child: _buildui2(width: constraints.maxWidth),
                            ),
                            Expanded(
                              flex: 1,
                              child:_buildui3(),
                            )
                          ],
                        ),
                      ),
                      const SizeBoxx(),
                      const ComunBottomBar(),
                ]),
              ),
            );
          }

        },);
      }
    );
  }
  Widget _buildui1({required double width}){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color:width<600? Colors.transparent : Colors.grey.withOpacity(0.3)),
          borderRadius:  BorderRadius.only(topLeft:  const Radius.circular(12), bottomLeft:   const Radius.circular(12),topRight: width<800? const Radius.circular(12):const Radius.circular(0),bottomRight: width<800? const Radius.circular(12):const Radius.circular(0)),
          color: notifire.getcontiner
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width<600? 20 : 40),
        child: Column(
          children: [
            const SizedBox(height: 40,),
            TextField(
              style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
                hintText: "Search...",
                hintStyle: mediumGreyTextStyle,
                disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color:  Colors.grey.withOpacity(0.3))),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: massageController.pepoleimage.length,
              itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  width<600? Get.to(const ChatBox()) : null;
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading:  CircleAvatar(radius: 24,backgroundColor: Colors.transparent,backgroundImage: AssetImage(massageController.pepoleimage[index])),
                      title: Text(massageController.pepolename[index],style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),overflow: TextOverflow.ellipsis),
                    trailing: Text(massageController.dates[index],style: mediumGreyTextStyle,overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(height: 16,),
                    Text(massageController.qutes[index],style: mediumGreyTextStyle,overflow: TextOverflow.ellipsis,maxLines: 1,)
                  ],
                ),
              );

            },),
            const SizedBox(height: 22,),

          ],
        ),
      ),
    );
  }
  Widget _buildui2({required double width}){
    return Container(
      // height: 700,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.only(topRight: width<1200?  const Radius.circular(12) : const Radius.circular(0),bottomRight: width<1200?  const Radius.circular(12) : const Radius.circular(0)),
        color: notifire.getcontiner
      ),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: ListTile(
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
                        child: Center(child: SvgPicture.asset("assets/phone.svg",height: 24,width: 24,color: appGreyColor)),
                      ),
                      const SizedBox(width: 10,),
                      width<1200? PopupMenuButton(
                        color: notifire.getcontiner,
                        constraints: const BoxConstraints(minWidth: 300,maxWidth: 300),
                        offset: const Offset(0, 50),
                        child:  Container(
                          height: 45,width: 45,decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.withOpacity(0.3)),
                        ),
                          child: Center(child: SvgPicture.asset("assets/more-vertical.svg",height: 20,width: 20,color: appGreyColor)),
                        ),
                        itemBuilder: (context) {
                        return [PopupMenuItem(padding: const EdgeInsets.all(0),child: _buildui3())];
                      },):const SizedBox(),
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
          _builchatui1(contante: "You can convert the."),
          const SizedBox(height: 80,),
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
                    onPressed: () {}, child: Text("Send".tr,style: mediumGreyTextStyle.copyWith(color: Colors.white),))
            ],),
          ),
          const SizedBox(height: 15,),


        ],
      ),
    );
  }
  Widget _buildui3(){
    return Container(
      // height: 700,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: const BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12)),
          color: notifire.getcontiner
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 45,width: 45,decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  ),
                    child: Center(child: SvgPicture.asset("assets/plus.svg",height: 24,width: 24,)),
                  ),
                ],
              ),
              const SizedBox(height: 31,),
              const CircleAvatar(radius: 70,backgroundColor: Colors.transparent,backgroundImage: AssetImage("assets/avatar1.png"),),
              const SizedBox(height: 15,),
              Text("Elon Musk",style: mainTextStyle.copyWith(color: notifire.getTextColor1),),
              const SizedBox(height: 8,),
              Text("Flutter Dev.",style: mediumGreyTextStyle,),
              const SizedBox(height: 30),
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
                title: Text("voice29.pdf",style: mediumGreyTextStyle),
                leading: SizedBox(height: 22,width: 22,child: SvgPicture.asset("assets/receipt.svg",color: appGreyColor,)),
                trailing: SizedBox(height: 22,width: 22,child: SvgPicture.asset("assets/dots-h.svg",color: appGreyColor,)),
              ),
              ListTile(
                title: Text("voice55.pdf",style: mediumGreyTextStyle),
                leading: SizedBox(height: 22,width: 22,child: SvgPicture.asset("assets/receipt.svg",color: appGreyColor,)),
                trailing: SizedBox(height: 22,width: 22,child: SvgPicture.asset("assets/dots-h.svg",color: appGreyColor,)),
              ),
              ListTile(
                title: Text("Document.docx",style: mediumGreyTextStyle),
                leading: SizedBox(height: 22,width: 22,child: SvgPicture.asset("assets/file-text.svg",color: appGreyColor,)),
                trailing: SizedBox(height: 22,width: 22,child: SvgPicture.asset("assets/dots-h.svg",color: appGreyColor,)),
              ),
              const SizedBox(height: 40,),
              ListTile(
                title: Text("Images",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1)),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text("29 Images",style: mediumGreyTextStyle,),
                ),
                trailing: SizedBox(
                    height: 20,
                    width: 20,
                    child: Center(child: SvgPicture.asset("assets/chevron-down.svg",height: 20,width: 20,))),
              ),
              const SizedBox(height: 20,),
              
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
              const SizedBox(height: 20),

        ]),
      ),
    );
  }
  Widget _builchatui({required String contante}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 120,
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
                          child: Center(child: Text(contante,style: mediumGreyTextStyle.copyWith(color: appGreyColor,height: 1.6,letterSpacing: 0.6),maxLines: 2)),
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
            child: Container(
              height: 120,),
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
            child:  Container(
              // height: 125,
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              // height: 125,
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
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12),bottomRight: Radius.circular(12),bottomLeft: Radius.circular(4)),
                            color: appMainColor,
                          ),
                          child: Center(child: Text(contante,style: mediumBlackTextStyle.copyWith(color: Colors.white,height: 1.6,letterSpacing: 0.6),maxLines: 2),),
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
