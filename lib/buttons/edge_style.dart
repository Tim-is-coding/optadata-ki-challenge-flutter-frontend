
// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/sizebox.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';
import '../provider/proviercolors.dart';

class EdgeStyle extends StatefulWidget {
  const EdgeStyle({Key? key}) : super(key: key);

  @override
  State<EdgeStyle> createState() => _EdgeStyleState();
}

class _EdgeStyleState extends State<EdgeStyle> {

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
                      const ComunTitle(title: 'Edge Buttons',path: "Buttons"),
                      _buildDefault(),
                      _buildLarge(),
                      _buildSmall(),
                      _buildExtraSmall(),
                      _buildActive(),
                      _buildDisable(),
                      _buildCustom(),
                      //............
                      _buildOutlineDefault(),
                      _buildOutlineBoldBorder(),
                      _buildOutlineLargeButtons(),
                      _buildOutlineSmallButtons(),
                      _buildOutlineExtraSmall(),
                      _buildOutlineDisable(),
                      _buildGradient(),
                      _buildLoader(),
                      _buildButtonwithicon(),
                      _buildButtonicon(),
                      const SizeBoxx(),
                      const ComunBottomBar(),

                    ],
                  ),
                ),
              );
            } else {

              return  SizedBox(
                height: 1000,
                width: double.infinity,

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Edge Buttons',path: "Buttons"),
                      _buildDefault(),
                      _buildLarge(),
                      _buildSmall(),
                      _buildExtraSmall(),
                      _buildActive(),
                      _buildDisable(),
                      _buildCustom(),
                      //............
                      _buildOutlineDefault(),
                      _buildOutlineBoldBorder(),
                      _buildOutlineLargeButtons(),
                      _buildOutlineSmallButtons(),
                      _buildOutlineExtraSmall(),
                      _buildOutlineDisable(),
                      _buildGradient(),
                      _buildLoader(),
                      _buildButtonwithicon(),
                      _buildButtonicon(),
                      const SizeBoxx(),
                      const ComunBottomBar(),


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
  Widget _buildDefault(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text("Default Buttons",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      _buildDefaultButton(title: "Primary Button", color: const Color(0xff7366ff)),
                      _buildDefaultButton(title: "Secondary Button", color: const Color(0xfff73164)),
                      _buildDefaultButton(title: "Success Button", color: const Color(0xff54ba4a)),
                      _buildDefaultButton(title: "info Button", color: const Color(0xff16c7f9)),
                      _buildDefaultButton(title: "Warning Button", color: const Color(0xffffaa05)),
                      _buildDefaultButton(title: "Danger Button", color: const Color(0xfffc4438)),
                      _buildDefaultButton(title: "Light Button", color: const Color(0xfff7f6ff),textcolor: Colors.black,bordertrue: true),
                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildLarge(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text("Large Buttons",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      _buildLargeButton(title: "Primary Button", color: const Color(0xff7366ff)),
                      _buildLargeButton(title: "Secondary Button", color: const Color(0xfff73164)),
                      _buildLargeButton(title: "Success Button", color: const Color(0xff54ba4a)),
                      _buildLargeButton(title: "info Button", color: const Color(0xff16c7f9)),
                      _buildLargeButton(title: "Warning Button", color: const Color(0xffffaa05)),
                      _buildLargeButton(title: "Danger Button", color: const Color(0xfffc4438)),
                      _buildLargeButton(title: "Light Button", color: const Color(0xfff7f6ff),textcolor: Colors.black,bordertrue: true),
                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildSmall(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text("Small Buttons",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      _buildSmallButton(title: "Primary Button", color: const Color(0xff7366ff)),
                      _buildSmallButton(title: "Secondary Button", color: const Color(0xfff73164)),
                      _buildSmallButton(title: "Success Button", color: const Color(0xff54ba4a)),
                      _buildSmallButton(title: "info Button", color: const Color(0xff16c7f9)),
                      _buildSmallButton(title: "Warning Button", color: const Color(0xffffaa05)),
                      _buildSmallButton(title: "Danger Button", color: const Color(0xfffc4438)),
                      _buildSmallButton(title: "Light Button", color: const Color(0xfff7f6ff),textcolor: Colors.black,bordertrue: true),
                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildExtraSmall(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text("Extra Small Buttons",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      _buildExtraSmallButton(title: "Primary Button", color: const Color(0xff7366ff)),
                      _buildExtraSmallButton(title: "Secondary Button", color: const Color(0xfff73164)),
                      _buildExtraSmallButton(title: "Success Button", color: const Color(0xff54ba4a)),
                      _buildExtraSmallButton(title: "info Button", color: const Color(0xff16c7f9)),
                      _buildExtraSmallButton(title: "Warning Button", color: const Color(0xffffaa05)),
                      _buildExtraSmallButton(title: "Danger Button", color: const Color(0xfffc4438)),
                      _buildExtraSmallButton(title: "Light Button", color: const Color(0xfff7f6ff),textcolor: Colors.black,bordertrue: true),
                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildActive(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text("Active Buttons",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      _buildDefaultButton(title: "Active", color: const Color(0xff7366ff)),
                      _buildDefaultButton(title: "Active", color: const Color(0xfff73164)),
                      _buildDefaultButton(title: "Active", color: const Color(0xff54ba4a)),
                      _buildDefaultButton(title: "Active", color: const Color(0xff16c7f9)),
                      _buildDefaultButton(title: "Active", color: const Color(0xffffaa05)),
                      _buildDefaultButton(title: "Active", color: const Color(0xfffc4438)),
                      _buildDefaultButton(title: "Active", color: const Color(0xfff7f6ff),textcolor: Colors.black,bordertrue: true),
                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildDisable(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text("Disabled Buttons",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      _buildDisableButton(title: "Disable", color: const Color(0xff7366ff)),
                      _buildDisableButton(title: "Disable", color: const Color(0xfff73164)),
                      _buildDisableButton(title: "Disable", color: const Color(0xff54ba4a)),
                      _buildDisableButton(title: "Disable", color: const Color(0xff16c7f9)),
                      _buildDisableButton(title: "Disable", color: const Color(0xffffaa05)),
                      _buildDisableButton(title: "Disable", color: const Color(0xfffc4438)),
                      _buildDisableButton(title: "Disable", color: const Color(0xfff7f6ff),textcolor: Colors.black,bordertrue: true),
                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildCustom(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text("Custom State Buttons",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      _buildDefaultButton(title: "Link", color: const Color(0xff7366ff)),
                      _buildDefaultButton(title: "Input", color: const Color(0xfff73164)),
                      _buildDefaultButton(title: "Submit", color: const Color(0xff54ba4a)),
                      _buildDefaultButton(title: "Button", color: const Color(0xff16c7f9)),
                    ],
                  ),
                ]),
          ),
        )

    );
  }


//........................

  Widget _buildOutlineDefault(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text("Outline Buttons",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      _buildOutlineDefaultButton(title: "Primary Button", color: const Color(0xff7366ff)),
                      _buildOutlineDefaultButton(title: "Secondary Button", color: const Color(0xfff73164)),
                      _buildOutlineDefaultButton(title: "Success Button", color: const Color(0xff54ba4a)),
                      _buildOutlineDefaultButton(title: "info Button", color: const Color(0xff16c7f9)),
                      _buildOutlineDefaultButton(title: "Warning Button", color: const Color(0xffffaa05)),
                      _buildOutlineDefaultButton(title: "Danger Button", color: const Color(0xfffc4438)),
                      _buildOutlineDefaultButton(title: "Light Button", color: const Color(0xffefefef),textcolor:notifire!.getMainText,bordertrue: true),
                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildOutlineBoldBorder(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text("Bold Border Outline Buttons",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      _buildOutlineBoldBorderButton(title: "Primary Button", color: const Color(0xff7366ff)),
                      _buildOutlineBoldBorderButton(title: "Secondary Button", color: const Color(0xfff73164)),
                      _buildOutlineBoldBorderButton(title: "Success Button", color: const Color(0xff54ba4a)),
                      _buildOutlineBoldBorderButton(title: "info Button", color: const Color(0xff16c7f9)),
                      _buildOutlineBoldBorderButton(title: "Warning Button", color: const Color(0xffffaa05)),
                      _buildOutlineBoldBorderButton(title: "Danger Button", color: const Color(0xfffc4438)),
                      _buildOutlineBoldBorderButton(title: "Light Button", color: const Color(0xffefefef),textcolor:  notifire!.getMainText,bordertrue: true),
                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildOutlineLargeButtons(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text("Outline Large Buttons",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      _buildOutlineLargeButton(title: "Primary Button", color: const Color(0xff7366ff)),
                      _buildOutlineLargeButton(title: "Secondary Button", color: const Color(0xfff73164)),
                      _buildOutlineLargeButton(title: "Success Button", color: const Color(0xff54ba4a)),
                      _buildOutlineLargeButton(title: "info Button", color: const Color(0xff16c7f9)),
                      _buildOutlineLargeButton(title: "Warning Button", color: const Color(0xffffaa05)),
                      _buildOutlineLargeButton(title: "Danger Button", color: const Color(0xfffc4438)),
                      _buildOutlineLargeButton(title: "Light Button", color: const Color(0xffefefef),textcolor: notifire!.getMainText,bordertrue: true),
                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildOutlineSmallButtons(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text("Outline Small Buttons",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      _buildOutlineSmallButton(title: "Primary Button", color: const Color(0xff7366ff)),
                      _buildOutlineSmallButton(title: "Secondary Button", color: const Color(0xfff73164)),
                      _buildOutlineSmallButton(title: "Success Button", color: const Color(0xff54ba4a)),
                      _buildOutlineSmallButton(title: "info Button", color: const Color(0xff16c7f9)),
                      _buildOutlineSmallButton(title: "Warning Button", color: const Color(0xffffaa05)),
                      _buildOutlineSmallButton(title: "Danger Button", color: const Color(0xfffc4438)),
                      _buildOutlineSmallButton(title: "Light Button", color: const Color(0xffefefef),textcolor: notifire!.getMainText,bordertrue: true),
                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildOutlineExtraSmall(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text("Outline Extra Small Buttons",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      _buildOutlineExtraSmallButton(title: "Primary Button", color: const Color(0xff7366ff)),
                      _buildOutlineExtraSmallButton(title: "Secondary Button", color: const Color(0xfff73164)),
                      _buildOutlineExtraSmallButton(title: "Success Button", color: const Color(0xff54ba4a)),
                      _buildOutlineExtraSmallButton(title: "info Button", color: const Color(0xff16c7f9)),
                      _buildOutlineExtraSmallButton(title: "Warning Button", color: const Color(0xffffaa05)),
                      _buildOutlineExtraSmallButton(title: "Danger Button", color: const Color(0xfffc4438)),
                      _buildOutlineExtraSmallButton(title: "Light Button", color: const Color(0xffefefef),textcolor: notifire!.getMainText,bordertrue: true),
                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildOutlineDisable(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text("Disabled Outline Buttons",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      _buildOutlineDisableButton(title: "Disabled", color: const Color(0xff7366ff)),
                      _buildOutlineDisableButton(title: "Disabled", color: const Color(0xfff73164)),
                      _buildOutlineDisableButton(title: "Disabled", color: const Color(0xff54ba4a)),
                      _buildOutlineDisableButton(title: "Disabled", color: const Color(0xff16c7f9)),
                      _buildOutlineDisableButton(title: "Disabled", color: const Color(0xffffaa05)),
                      _buildOutlineDisableButton(title: "Disabled", color: const Color(0xfffc4438)),
                      _buildOutlineDisableButton(title: "Disabled", color: const Color(0xffefefef),textcolor:  notifire!.getMainText,bordertrue: true),
                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildGradient(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text("Gradien Buttons",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      _buildGradientButtons(title: "Primary Button", color: const Color(0xff5747ff), color2:  const Color(0xff9389ff)),
                      _buildGradientButtons(title: "Secondary Button", color: const Color(0xffff0e48), color2:  const Color(0xffff577f)),
                      _buildGradientButtons(title: "Success Button", color: const Color(0xff459f3c), color2:  const Color(0xff6cc164)),
                      _buildGradientButtons(title: "info Button", color: const Color(0xff07b0e0), color2:  const Color(0xff3cd0f9)),
                      _buildGradientButtons(title: "Warning Button", color: const Color(0xffdb9100), color2:  const Color(0xfffdb52b)),
                      _buildGradientButtons(title: "Danger Button", color: const Color(0xfffc2619), color2:  const Color(0xfffc645a)),
                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildLoader(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: notifire!.getcontiner,
            boxShadow: boxShadow,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Button Loader",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      _buildLoaderButton(title: "Primary", color: const Color(0xff5747ff), leding: const SizedBox(height: 30,width: 30,child: Center(child: CircularProgressIndicator(color: Colors.white)),), ),
                      _buildLoaderButton(title: "process", color: const Color(0xffff0e48), leding: const SizedBox(height: 30,width: 30,child: Center(child: CupertinoActivityIndicator(color: Colors.white)),),),
                      _buildLoaderButton(title: "Success", color: const Color(0xff459f3c),leding: const SizedBox(height: 30)),

                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildButtonwithicon(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: notifire!.getcontiner,
            boxShadow: boxShadow,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Button With Icon",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [

                      _buildButtonWithIcon(title: "Add", color: const Color(0xff7366ff), leding: Icons.add),
                      _buildButtonWithIcon(title: "Edite", color: const Color(0xfff73164), leding: Icons.edit),
                      _buildButtonWithIcon(title: "Delete", color: const Color(0xfffc4438), leding: Icons.delete),

                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildButtonicon(){
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: notifire!.getcontiner,
            boxShadow: boxShadow,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Icon Button",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: 20,
                    spacing: 20,
                    children: [

                      IconButton(onPressed: () {}, icon:  const Icon(Icons.add,color: Color(0xff7366ff),)),
                      IconButton(onPressed: () {}, icon:  const Icon(Icons.edit,color: Color(0xfff73164),)),
                      IconButton(onPressed: () {}, icon:  const Icon(Icons.delete,color: Color(0xfffc4438),)),


                    ],
                  ),
                ]),
          ),
        )

    );
  }
  //........................

  Widget _buildDefaultButton({required String title,required Color color,Color? textcolor,bool bordertrue = false}){
    return  ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(elevation: 0,
            side: BorderSide(color: bordertrue?Colors.grey.shade300:Colors.transparent),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),
            backgroundColor: color
        ),
        child:  Text(title,style:  TextStyle(fontWeight: FontWeight.w300,color: textcolor ?? Colors.white),));
  }

  Widget _buildOutlineDefaultButton({required String title,required Color color,Color? textcolor,bool bordertrue = false}){
    return  OutlinedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          side: BorderSide(color: color),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),

        ),
        child:  Text(title,style:  TextStyle(fontWeight: FontWeight.w300,color: textcolor ?? color),));
  }

  Widget _buildLargeButton({required String title,required Color color,Color? textcolor,bool bordertrue = false}){
    return  TextButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            side: BorderSide(color: bordertrue?Colors.grey.shade300:Colors.transparent),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),
            backgroundColor: color
        ),
        child:  Text(title,style:  TextStyle(color: textcolor ?? Colors.white,fontSize: 17),));
  }

  Widget _buildOutlineLargeButton({required String title,required Color color,Color? textcolor,bool bordertrue = false}){
    return  TextButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          side: BorderSide(color: color),
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),

        ),
        child:  Text(title,style:  TextStyle(color: textcolor ?? color,fontSize: 17),));
  }

  Widget _buildOutlineBoldBorderButton({required String title,required Color color,Color? textcolor,bool bordertrue = false}){
    return  TextButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          side: BorderSide(color: color,width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),

        ),
        child:  Text(title,style:  TextStyle(fontWeight: FontWeight.w300,color: textcolor ?? color),));
  }

  Widget _buildSmallButton({required String title,required Color color,Color? textcolor,bool bordertrue = false}){
    return  TextButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            side: BorderSide(color: bordertrue?Colors.grey.shade300:Colors.transparent),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),
            backgroundColor: color
        ),
        child:  Text(title,style:  TextStyle(color: textcolor ?? Colors.white,fontSize: 11,fontWeight: FontWeight.w300),));
  }

  Widget _buildOutlineSmallButton({required String title,required Color color,Color? textcolor,bool bordertrue = false}){
    return  TextButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadowColor: Colors.transparent,
          side: BorderSide(color: color),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),

        ),
        child:  Text(title,style:  TextStyle(color: textcolor ?? color,fontSize: 11,fontWeight: FontWeight.w300),));
  }
  Widget _buildLoaderButton({required String title,required Color color,Color? textcolor,bool bordertrue = false,required Widget leding}){
    return  ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            elevation: 0,
            side: BorderSide(color: bordertrue?Colors.grey.shade300:Colors.transparent),
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),
            backgroundColor: color
        ),
        child:  Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leding,
            const SizedBox(width: 10,),
            Text(title,style:  TextStyle(fontWeight: FontWeight.w300,color: textcolor ?? Colors.white),),
          ],
        ));
  }
  Widget _buildButtonWithIcon({required String title,required Color color,Color? textcolor,bool bordertrue = false,required IconData leding}){
    return  ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(elevation: 0,
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            side: BorderSide(color: bordertrue?Colors.grey.shade300:Colors.transparent),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),
            backgroundColor: color
        ),
        child:  Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(leding,color: Colors.white,size: 18,),
            const SizedBox(width: 10,),
            Text(title,style:  TextStyle(fontWeight: FontWeight.w300,color: textcolor ?? Colors.white),),
          ],
        ));
  }
  Widget _buildExtraSmallButton({required String title,required Color color,Color? textcolor,bool bordertrue = false}){
    return  TextButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            side: BorderSide(color: bordertrue?Colors.grey.shade300:Colors.transparent),
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
            backgroundColor: color
        ),
        child:  Text(title,style:  TextStyle(color: textcolor ?? Colors.white,fontSize: 10,fontWeight: FontWeight.w300),));
  }

  Widget _buildOutlineExtraSmallButton({required String title,required Color color,Color? textcolor,bool bordertrue = false}){
    return  TextButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadowColor: Colors.transparent,
          side: BorderSide(color: color),
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),

        ),
        child:  Text(title,style:  TextStyle(color: textcolor ?? color,fontSize: 10,fontWeight: FontWeight.w300),));
  }

  Widget _buildDisableButton({required String title,required Color color,Color? textcolor,bool bordertrue = false}){
    return  ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            side: BorderSide(color: bordertrue?Colors.grey.shade300:Colors.transparent),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),
            backgroundColor: color
        ),
        child:  Text(title,style:   TextStyle(fontWeight: FontWeight.w300,color: notifire!.getMainText),));
  }

  Widget _buildOutlineDisableButton({required String title,required Color color,Color? textcolor,bool bordertrue = false}){
    return  TextButton(
        onPressed: null,

        style: ElevatedButton.styleFrom(elevation: 0,
          side: BorderSide(color: color),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),

        ),
        child:  Text(title,style:   TextStyle(fontWeight: FontWeight.w300,color: notifire!.getMainText),));
  }

  Widget _buildGradientButtons({required String title,required Color color,required Color color2}){
    return  Container(
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [color, color2])),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(elevation: 0,
              side: const BorderSide(color: Colors.transparent),
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),
              backgroundColor: Colors.transparent
          ),
          child:  Text(title,style:  const TextStyle(fontWeight: FontWeight.w300,color:  Colors.white),)),
    );
  }
}
