

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/textfilde.dart';
import '../appstaticdata/staticdata.dart';
import '../provider/proviercolors.dart';

class ModalPage extends StatefulWidget {
  const ModalPage({Key? key}) : super(key: key);

  @override
  State<ModalPage> createState() => _ModalPageState();
}

class _ModalPageState extends State<ModalPage> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifire>(
      builder: (context, value, child) => Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        color: notifire!.getbgcolor,

        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) {

              // Mobile layout
              return   SizedBox(
                height: 900,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Modal',path: "Ui kits"),

                      _buildui(),
                      _buildui1(),
                      _buildui2(),
                      _buildui3(),

                    ],
                  ),
                ),
              );
            } else if (constraints.maxWidth < 1000) {

              return  SizedBox(
                height: 1000,
                width: double.infinity,

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Modal',path: "Ui kits"),
                      Row(
                        children: [
                          Expanded(
                            child: _buildui(),
                          ),
                          Expanded(
                              child: _buildui1()
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _buildui2(),
                          ),
                          Expanded(
                              child: _buildui3()
                          ),
                        ],
                      )



                    ],
                  ),
                ),
              );


            } else {
              // Website layout
              return   SizedBox(

                height: 1000,
                width: double.infinity,

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Modal',path: "Ui kits"),

                      Row(
                        children: [
                          Expanded(
                            child: _buildui(),
                          ),
                          Expanded(
                              child: _buildui1()
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _buildui2(),
                          ),
                          Expanded(
                              child: _buildui3()
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildui(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        // height: 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text("Simple",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
            const SizedBox(height: 20,),
             // Text("Different types of basic modals using like", style: mediumGreyTextStyle.copyWith(height: 1.7)),
            // Divider(color: Colors.grey.shade300,height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildcomunbutton(title: 'Launch Modal', color: const Color(0xfff73164),ontap: () {
                  _buildSimple();
                },),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _buildui1(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        // height: 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire!.getcontiner,
          boxShadow: boxShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Scrolling Content",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
            const SizedBox(height: 20,),
            // Text("Different types of basic modals using like", style: mediumGreyTextStyle.copyWith(height: 1.7)),
            // Divider(color: Colors.grey.shade300,height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildcomunbutton(title: 'Launch Modal', color: const Color(0xff54ba4a),ontap: () {
                  _buildScrollingContent();
                },),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _buildui2(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        // height: 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire!.getcontiner,
          boxShadow: boxShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tooltips And Popovers",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
            const SizedBox(height: 20,),
            // Text("Different types of basic modals using like", style: mediumGreyTextStyle.copyWith(height: 1.7)),
            // Divider(color: Colors.grey.shade300,height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 20,),
                _buildcomunbutton(title: 'Launch Modal', color: const Color(0xff16c7f9),ontap: () {
                  _buildTooltips();
                },),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _buildui3(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        // height: 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire!.getcontiner,
          boxShadow: boxShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Open Model For Buzz",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
            const SizedBox(height: 20,),
            // Text("Different types of basic modals using like", style: mediumGreyTextStyle.copyWith(height: 1.7)),
            // Divider(color: Colors.grey.shade300,height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildcomunbutton(title: 'Launch Modal', color: appMainColor,ontap: () {
                  _buildBuzzModel();
                },),
              ],
            )
          ],
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  Widget _buildcomunbutton({required String title,required Color color,void Function()? ontap}){
    return  ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: color.withOpacity(0.1),
            fixedSize: const Size.fromHeight(34)
        ),
        child:  Text(title,style:  TextStyle(color: color,fontSize: 14,fontWeight: FontWeight.w200),));

  }

  Future<void> _buildSimple(){
    return showDialog(context: context,
      anchorPoint: const Offset(200, 389),
      builder: (context) {
      return Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                width:  500,
                decoration: BoxDecoration(
                color: notifire!.getcontiner,
                    borderRadius: BorderRadius.circular(10)),
                child:  Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                     RichText(text:  TextSpan(children: [
                       TextSpan(text: "Lorem Ipsum ",style: mainTextStyle.copyWith(fontSize: 20, color: notifire!.getMainText)),
                       TextSpan(text: "dummy text ",style: mainTextStyle.copyWith(fontSize: 20,color: appMainColor)),
                       TextSpan(text: "imply dummy text of the printing",style: mainTextStyle.copyWith(fontSize: 20,color: notifire!.getMainText)),

                     ])),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              height: 230,
                              child: Image.asset("assets/objects 1.png",fit: BoxFit.fill),
                            ),
                          ),
                        ],
                      ),
                       Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",textAlign: TextAlign.center,style: mediumBlackTextStyle.copyWith(height: 1.7,color: notifire!.getMainText),),

                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: appMainColor,
                                  fixedSize: const Size.fromHeight(34)
                              ),
                              child:  Row(
                                children: [
                                   Text("Explore More",style: mediumBlackTextStyle.copyWith(color: Colors.white,fontWeight: FontWeight.w200),),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                                    child: SvgPicture.asset("assets/arrow-right-small.svg",color: Colors.white,height: 10,width: 10,),
                                  )
                                ],
                              ))

                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },);
  }

  Future<void> _buildScrollingContent(){
    return showDialog(context: context,
      anchorPoint: const Offset(200, 389),
      builder: (context) {
        return Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    width:  500,
                    decoration: BoxDecoration(
                        color: notifire!.getcontiner,
                        borderRadius: BorderRadius.circular(10)),
                    child:   Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                           Text("Scrolling modal",style: mediumGreyTextStyle.copyWith(fontSize: 18),),
                          Divider(color: Colors.grey.shade300,height: 30,),
                           Text("Wed designer",style: mediumGreyTextStyle.copyWith(fontSize: 17)),
                          const SizedBox(height: 12,),

                          _buildparagraph(content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy"),
                          _buildparagraph(content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy"),
                          _buildparagraph(content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummyLorem Ipsum is simply dummy text of the printing and typesetting industry"),
                          _buildparagraph(content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy"),

                          const SizedBox(height: 12,),
                           Text("UX designer",style: mediumGreyTextStyle.copyWith(fontSize: 15)),
                          const SizedBox(height: 12,),

                          _buildparagraph(content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummyese duties can differ greatly between organizations."),
                          _buildparagraph(content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummyt Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy"),
                          _buildparagraph(content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy"),
                          _buildparagraph(content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummyto Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy"),

                          Divider(color: Colors.grey.shade300,height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _buildcomunbutton(title: "Close", color: const Color(0xfff73164),ontap: () {
                                Get.back();
                              },),
                              const SizedBox(width: 12,),
                              _buildcomunbutton(title: "Save Changes", color: appMainColor,ontap: () {},),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _buildBuzzModel(){
    return showDialog(context: context,
      anchorPoint: const Offset(200, 389),
      builder: (context) {
        return Align(
          alignment: Alignment.topCenter,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    width:  500,
                    decoration: BoxDecoration(
                        color: notifire!.getcontiner,
                        borderRadius: BorderRadius.circular(10)),
                    child: Material(
                      color: notifire!.getcontiner,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: StatefulBuilder(
                        builder: (context,setState) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[

                                 Text("Buzz SIGN-UP",style: TextStyle(color: notifire!.getMainText,fontWeight: FontWeight.w700,fontSize: 20),),
                                const SizedBox(height: 25,),
                                Row(
                                  children: [
                                    Expanded(child: ComunTextField(title: 'First name', hinttext: "Enter Your name", controller: controller)),
                                    const SizedBox(width: 10,),
                                    Expanded(child: ComunTextField(title: 'Last name', hinttext: "Enter Your Surname", controller: controller1)),
                                  ],
                                ),
                                const SizedBox(height: 15,),
                                ComunTextField(title: 'Enter Email', hinttext: "Enter Your Email", controller: controller2),
                                ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  leading: Checkbox(
                                    side: BorderSide(color: notifire!.getbordercolor),
                                    checkColor: Colors.white,
                                    activeColor: appMainColor,
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                  title:  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: TextStyle(fontSize: 12,color: notifire!.getMainText)),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    _buildcomunbutton(title: 'Sing Up', color: appMainColor,ontap: () {
                                      if (_formKey.currentState!.validate()) {

                                      }
                                    },),
                                  ],
                                )

                              ],
                            ),
                          );
                        }
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },);
  }

  Widget _buildparagraph({required String content}){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SvgPicture.asset("assets/arrow-right-circle.svg",height: 17,width: 17,color: Colors.red,),
        ),
        const SizedBox(width: 10,),
         Expanded(child: Text(content,style:  TextStyle(height: 2,color: notifire!.getMainText),))
      ],
    );
  }

  Future<void> _buildTooltips(){
    return showDialog(context: context,
      anchorPoint: const Offset(200, 389),
      builder: (context) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            width: 500,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
            color: notifire!.getcontiner,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                 Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text("Tooltip and popover modal",style:  mediumGreyTextStyle.copyWith(fontSize: 18, color: notifire!.getMainText)),
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset("assets/times.svg",height: 16,width: 16,))
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade400,height: 30,),
                 Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("Popover in a modal",style:  mediumGreyTextStyle.copyWith(fontSize: 18)),
                ),
                const SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                       Text("This  ",style: TextStyle(color: notifire!.getMainText),),
                      Tooltip(
                          message: "This is amazing Content",
                          decoration: BoxDecoration(color: appMainColor.withOpacity(0.2)),
                          textStyle: const TextStyle(color: appMainColor),
                          child: _buildcomunbutton(title: 'Button', color: const Color(0xff54ba4a),ontap: () {},)),
                       Text("  triggers a popover on click.",style: TextStyle(color: notifire!.getMainText)),

                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade400,height: 30,),
                 Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("Tooltips in a modal",style:  mediumGreyTextStyle.copyWith(fontSize: 18)),
                ),
                const SizedBox(height: 12,),

                 Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Tooltip(
                          message: "Tooltip",
                          decoration: BoxDecoration(color: appMainColor.withOpacity(0.2)),
                          textStyle: const TextStyle(color: appMainColor),
                          child: const Text("This link ",style: TextStyle(color: Color(0xff16c7f9)))),
                       Text(" and ",style: TextStyle(color: notifire!.getMainText)),
                      Tooltip(
                          message: "Tooltip",
                          decoration: BoxDecoration(color: appMainColor.withOpacity(0.2)),
                          textStyle: const TextStyle(color: appMainColor),
                          child: const Text("that link ",style: TextStyle(color: Color(0xff16c7f9)))),
                       Text(" have tooltips on hover.",style: TextStyle(color: notifire!.getMainText)),
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade400,height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  _buildcomunbutton(title: 'Close', color: const Color(0xfff73164),ontap: () {
                    Get.back();
                  },),
                    const SizedBox(width: 6,),
                    _buildcomunbutton(title: 'Save Changes', color: appMainColor,ontap: () {},),
                    const SizedBox(width: 6,),
                  ],
                )

                ],
               ),
             )
           ],
          ),
        );
      },
    );
  }
}
