
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/sizebox.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';
import '../provider/proviercolors.dart';



class UsersCardsPage extends StatefulWidget {
  const UsersCardsPage({Key? key}) : super(key: key);

  @override
  State<UsersCardsPage> createState() => _UsersCardsPageState();
}

class _UsersCardsPageState extends State<UsersCardsPage> {



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
              return    SizedBox(
                height: 900,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const ComunTitle(title: 'User Cards',path: "Users"),
                      _buildGridview(count: 1),
                      const SizeBoxx(),
                      const ComunBottomBar(),

                    ],
                  ),
                ),
              );
            } else if (constraints.maxWidth < 1200) {
              if(constraints.maxWidth < 800){
                return    SizedBox(
                  height: 1000,
                  width: double.infinity,

                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const ComunTitle(title: 'User Cards',path: "Users"),
                        _buildGridview(count: 2 ),
                        const SizeBoxx(),
                        const ComunBottomBar(),

                      ],
                    ),
                  ),
                );
              }else{
                return    SizedBox(
                  height: 1000,
                  width: double.infinity,

                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const ComunTitle(title: 'User Cards',path: "Users"),
                        _buildGridview(count: 3 ),
                        const SizeBoxx(),
                        const ComunBottomBar(),

                      ],
                    ),
                  ),
                );
              }


            } else {
              // Website layout
              return  SizedBox(

                height: 1000,
                width: double.infinity,

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'User Cards',path: "Users"),
                      _buildGridview(count: 4),
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

  Widget _buildGridview({required int count}){
    return  GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: count,mainAxisExtent: 400),
      itemCount: 8,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(padding),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: notifire!.getcontiner,
              boxShadow: boxShadow,
            ),
            child:  Column(
              children: [
                const SizedBox(height: 40,),

                const CircleAvatar(radius: 40, backgroundColor: Colors.transparent,backgroundImage: AssetImage("assets/avatar.png")),
                const SizedBox(height: 10,),

                Text("M.S Dhoni",style: mediumBlackTextStyle.copyWith(fontSize: 16, color: notifire!.getMainText)),
                const SizedBox(height: 8,),
                Text("Captain",style: mediumGreyTextStyle,),
                // Text("@brookly.simmons",style: mediumGreyTextStyle),
                const SizedBox(height: 24,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Text("1,908",style:  mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                          const SizedBox(height: 5,),
                          Text("Posts",style: mediumGreyTextStyle,overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),

                    const SizedBox(
                        height: 20,
                        child: VerticalDivider(color: Colors.grey,width: 50)),

                    Flexible(
                      child: Column(
                        children: [
                          Text("34.0k",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                          const SizedBox(height: 5,),
                          Text("Followers",style: mediumGreyTextStyle,overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    const SizedBox(
                        height: 20,
                        child: VerticalDivider(color: Colors.grey,width: 50)),

                    Flexible(
                      child: Column(
                        children: [
                          Text("1400",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                          const SizedBox(height: 5,),
                          Text("Following",style: mediumGreyTextStyle,overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withOpacity(0.1),
                      ),
                      child: Center(child: SvgPicture.asset("assets/trophy.svg",width: 25,height: 25,))),
                  const SizedBox(width: 10,),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow.withOpacity(0.1),
                      ),
                      child: Center(child: SvgPicture.asset("assets/trophy2.svg",width: 25,height: 25,))),
                  const SizedBox(width: 10,),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      color: Colors.red.withOpacity(0.1),
                      ),
                      child: Center(child: SvgPicture.asset("assets/trophy3.svg",width: 25,height: 25,))),
                    const SizedBox(width: 10,),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      color: Colors.green.withOpacity(0.1),
                      ),
                      child: Center(child: SvgPicture.asset("assets/award.svg",width: 25,height: 25,))),
                ],),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(

                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff674aff),
                              fixedSize: const Size.fromHeight(40),
                            ),
                            onPressed: () {}, child: Text("View Profile",style: mediumBlackTextStyle.copyWith(color: Colors.white),)),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        );

      },);
  }
}

