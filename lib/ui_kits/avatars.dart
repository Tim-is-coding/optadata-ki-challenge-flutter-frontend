
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/sizebox.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';
import '../provider/proviercolors.dart';

class AvatarsPage extends StatefulWidget {
  const AvatarsPage({Key? key}) : super(key: key);

  @override
  State<AvatarsPage> createState() => _AvatarsPageState();
}

class _AvatarsPageState extends State<AvatarsPage> {

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
              return  SizedBox(
                height: 900,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Avatars',path: "Ui kits"),
                      _buildSize(),
                      _buildStatus(),
                      _buildGrouping(),
                      SizedBox(height: Get.height*0.04,),
                      const SizeBoxx(),
                      const ComunBottomBar(),

                    ],
                  ),
                ),
              );
            } else if (constraints.maxWidth < 1000) {

              return SizedBox(
                height: 1000,
                width: double.infinity,

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Avatars',path: "Ui kits"),
                      _buildSize(),
                      _buildStatus(),
                      _buildGrouping(),
                      SizedBox(height: Get.height*0.04,),
                      const SizeBoxx(),
                      const ComunBottomBar(),
                    ],
                  ),
                ),
              );


            } else {
              // Website layout
              return  SizedBox(

                height: 1000,
                width: double.infinity,

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Avatars',path: "Ui kits"),

                      _buildSize(),
                      _buildStatus(),
                      _buildGrouping(),
                      SizedBox(height: Get.height*0.04,),
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

  Widget _buildSize(){
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
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text("Sizes",style: mainTextStyle.copyWith(color: notifire!.getMainText),maxLines: 2,overflow: TextOverflow.ellipsis),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),

                  Divider(color: Colors.grey.shade300,height: 60,),

               Wrap(
                 spacing: 20,
                 runSpacing: 20,
                 crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      _buildcirclaravatar(),

                      _buildcirclaravatar1(),

                      _buildcirclaravatar2(),

                      _buildcirclaravatar3(),
                    ],
                  ),
                ]),
          ),
        )

    );
  }

  Widget _buildStatus(){
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
                       Text("Status indicator",style: mainTextStyle.copyWith(color: notifire!.getMainText),maxLines: 2,overflow: TextOverflow.ellipsis),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                    ],
                  ),


                  Divider(color: Colors.grey.shade300,height: 60,),

                  Wrap(
                    spacing: 20,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            _buildcirclaravatar(),
                            const Positioned(
                                right: -50,
                                bottom: -3,
                                left: 0,
                                 

                                child: CircleAvatar(radius:7,backgroundColor: Colors.green,))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            _buildcirclaravatar1(),
                            const Positioned(
                                right: -50,
                                bottom: -3,
                                left: 0,


                                child: CircleAvatar(radius: 7,backgroundColor: Colors.orange,))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            _buildcirclaravatar2(),
                            const Positioned(
                                right: -50,
                                bottom: -3,
                                left: 0,
                                child: CircleAvatar(radius: 7,backgroundColor: Colors.red,))
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 70,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            _buildcirclaravatar3(),
                            const Positioned(
                                right: -50,
                                bottom: -3,
                                left: 0,
                                child: CircleAvatar(radius: 7,backgroundColor: Colors.green,))
                          ],
                        ),
                      ),

                    ],
                  ),
                ]),
          ),
        )

    );
  }
  Widget _buildGrouping(){
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
                     Text("Grouping",style: mainTextStyle.copyWith(color: notifire!.getMainText),maxLines: 2),
                    const Expanded(child: SizedBox()),
                    SvgPicture.asset("assets/settingsfill.svg",color: appMainColor,width: 18,height: 18,)
                  ],
                ),

                Divider(color: Colors.grey.shade300,height: 60,),

                SizedBox(
                  height: 100,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      _buildcirclaravatar(),
                      Positioned(
                          top: 0,
                          bottom: 0,
                          right: -60,
                          child: _buildcirclaravatar1()),
                      Positioned(
                          top: 0,
                          bottom: 0,
                          right: -120,
                          child: _buildcirclaravatar2()),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget _buildcirclaravatar(){

    return const CircleAvatar(radius: 50,backgroundImage: AssetImage("assets/avatar.png"), backgroundColor: Colors.transparent,);
  }
  Widget _buildcirclaravatar1(){
    return const CircleAvatar(radius: 45,backgroundColor: Colors.transparent,backgroundImage: AssetImage("assets/avatar1.png"),);
  }
  Widget _buildcirclaravatar2(){
    return const CircleAvatar(radius: 40,backgroundColor: Colors.transparent,backgroundImage: AssetImage("assets/avatar2.png"),);
  }
  Widget _buildcirclaravatar3(){
    return const CircleAvatar(radius: 35,backgroundImage: AssetImage("assets/avatar.png"),backgroundColor: Colors.transparent,);
  }

}
