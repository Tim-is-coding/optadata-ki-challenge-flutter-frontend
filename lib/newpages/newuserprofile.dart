// ignore_for_file: deprecated_member_use

import 'package:buzz/appstaticdata/staticdata.dart';
import 'package:buzz/provider/proviercolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/sizebox.dart';
import '../comunbottombar.dart';

class NewUserProfile extends StatefulWidget {
  const NewUserProfile({super.key});

  @override
  State<NewUserProfile> createState() => _NewUserProfileState();
}

class _NewUserProfileState extends State<NewUserProfile> with SingleTickerProviderStateMixin {
  ColorNotifire notifire = ColorNotifire();

  List name  =[
    "Dwayne Johnson ",
    "Elon Musk",
    "Jeff Bezos",
    "Warren Buffett",
    "Elon Musk",
    "Jeff Bezos",
    "Warren Buffett",
    "Elon Musk",


  ];
  List bio =[
    "American actor",
    "Tumblr",
    "Amazon",
    "Berkshire Hathaway",
    "Tumblr",
    "Amazon",
    "Berkshire Hathaway",
    "Amazon",

  ];

  List profile =[
    "assets/avatar.png",
    "assets/avatar1.png",
    "assets/avatar2.png",
    "assets/avatar.png",
    "assets/avatar1.png",
    "assets/avatar.png",
    "assets/avatar2.png",
    "assets/avatar.png",

  ];

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );
  }
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context,listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: LayoutBuilder(
          builder: (context, constraints) {
         if(constraints.maxWidth<600){
           return NestedScrollView(
               // physics: const BouncingScrollPhysics(),
               headerSliverBuilder: (context, innerBoxIsScrolled) {
               return [
                 const SliverToBoxAdapter(child:  ComunTitle(title: 'User Profile',path: "Users"),),
               SliverToBoxAdapter(child: _buidUi(width: constraints.maxWidth),),
               ];
           }, body: TabBarView(
               controller: _tabController,
               children: [
                 SingleChildScrollView(
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 0,right: padding,left: padding,bottom: 0),
                         child: Container(
                           decoration:  BoxDecoration(
                             color: notifire.getcontiner,
                             borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                           ),
                           child: Column(
                               children: [
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile1(count: 2,isphon: true),
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile2(isphon: true),
                                       ),
                                     ),
                                   ],
                                 ),
                               ]
                           ),
                         ),
                       ),
                       const SizeBoxx(),
                       const ComunBottomBar(),
                     ],
                   ),
                 ),
                 SingleChildScrollView(
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 0,right: padding,left: padding,bottom: 0),
                         child: Container(
                           decoration:  BoxDecoration(
                             color: notifire.getcontiner,
                             borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                           ),
                           child: Column(
                               children: [
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile2(isphon: true),
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile1(isphon: true,count: 2,),
                                       ),
                                     ),
                                   ],
                                 ),

                               ]
                           ),
                         ),
                       ),
                       const SizeBoxx(),
                       const ComunBottomBar(),
                     ],
                   ),
                 ),
                 SingleChildScrollView(
                   child: Column(
                     children: [
                       Padding(
                        padding: const EdgeInsets.only(top: 0,right: padding,left: padding,bottom: 0),
                         child: Container(
                           decoration:  BoxDecoration(
                             color: notifire.getcontiner,
                             borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                           ),
                           child: Column(
                               children: [
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile1(count: 2,isphon: true),
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile2(isphon: true),
                                       ),
                                     ),
                                   ],
                                 ),
                               ]
                           ),
                         ),
                       ),
                       const SizeBoxx(),
                       const ComunBottomBar(),
                     ],
                   ),
                 ),
               ]
           )
           );
         }else if(constraints.maxWidth<1000){
           return NestedScrollView(
                // physics: const BouncingScrollPhysics(),
               headerSliverBuilder: (context, innerBoxIsScrolled) {
             return [
               const SliverToBoxAdapter(child:  ComunTitle(title: 'User Profile',path: "Users"),),
               SliverToBoxAdapter(child: _buidUi(width: constraints.maxWidth),),
             ];
           },
               body: TabBarView(
               controller: _tabController,
               children: [
                 SingleChildScrollView(
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 0,right: padding,left: padding,bottom: 0),
                         child: Container(
                            decoration:  BoxDecoration(
                             color: notifire.getcontiner,
                             borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                           ),
                           child: Column(
                               children: [
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile1(count: 4,isphon: false),
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile2(isphon: false),
                                       ),
                                     ),
                                   ],
                                 ),

                               ]
                           ),
                         ),
                       ),
                       const SizeBoxx(),
                       const ComunBottomBar(),
                     ],
                   ),
                 ),
                 SingleChildScrollView(
                   child: Column(
                     children: [
                       Padding(
                       padding: const EdgeInsets.only(top: 0,right: padding,left: padding,bottom: 0),
                         child: Container(
                           decoration:  BoxDecoration(
                             color: notifire.getcontiner,
                             borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                           ),
                           child: Column(
                               children: [
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile2(isphon: true),
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile1(isphon: true,count: 2,),
                                       ),
                                     ),
                                   ],
                                 ),
                               ]
                           ),
                         ),
                       ),
                       const SizeBoxx(),
                       const ComunBottomBar(),
                     ],
                   ),
                 ),
                 SingleChildScrollView(
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 0,right: padding,left: padding,bottom: 0),
                         child: Container(
                           decoration:  BoxDecoration(
                             color: notifire.getcontiner,
                             borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                           ),
                           child: Column(
                               children: [
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile1(count: 2,isphon: true),
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile2(isphon: true),
                                       ),
                                     ),
                                   ],
                                 ),
                               ]
                           ),
                         ),
                       ),
                       const SizeBoxx(),
                       const ComunBottomBar(),
                     ],
                   ),
                 ),

               ]
              )
           );
         }else{
           return NestedScrollView(
               // physics: const BouncingScrollPhysics(),
               headerSliverBuilder: (context, innerBoxIsScrolled) {
             return [
               const SliverToBoxAdapter(child:  ComunTitle(title: 'User Profile',path: "Users"),),
                SliverToBoxAdapter(child: _buidUi(width: constraints.maxWidth),),
             ];
           },
               body: TabBarView(
                 // physics: const NeverScrollableScrollPhysics(),
                   controller: _tabController,
                   children: [
                     SingleChildScrollView(
                       // physics: const BouncingScrollPhysics(),
                       child: Column(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(top: 0,right: padding,left: padding,bottom: 0),
                               child: Container(
                                 decoration:  BoxDecoration(
                                 color: notifire.getcontiner,
                                   borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                                 ),
                                 child: Row(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Expanded(
                                       flex: 1,
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile1(count: 4,isphon: false),
                                       ),
                                     ),
                                     Expanded(
                                       flex: 2,
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile2(isphon: false),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                             const SizeBoxx(),
                             const ComunBottomBar(),
                           ]),
                     ),
                     SingleChildScrollView(
                       // physics: const NeverScrollableScrollPhysics(),
                       child: Column(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(top: 0,right: padding,left: padding,bottom: 0),
                               child: Container(
                                 decoration:  BoxDecoration(
                                   color: notifire.getcontiner,
                                   borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                                 ),
                                 child: Row(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Expanded(
                                       flex: 1,
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile2(isphon: false),
                                       ),
                                     ),
                                     Expanded(
                                       flex: 2,
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile1(isphon: false,count: 2,),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                             const SizeBoxx(),
                             const ComunBottomBar(),
                           ]),
                     ),
                     SingleChildScrollView(
                       // physics: const NeverScrollableScrollPhysics(),
                       child: Column(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(top: 0,right: padding,left: padding,bottom: 0),
                               child: Container(
                                 decoration:  BoxDecoration(
                                   color: notifire.getcontiner,
                                   borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                                 ),
                                 child: Row(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Expanded(
                                       flex: 1,
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile1(count: 4,isphon: false),
                                       ),
                                     ),
                                     Expanded(
                                       flex: 2,
                                       child: Padding(
                                         padding: const EdgeInsets.all(padding),
                                         child: _buildProfile2(isphon: false),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                             const SizeBoxx(),
                             const ComunBottomBar(),
                           ]),
                     ),

                   ])
           );
         }
        },),
      ),
    );
  }

  Widget _buildProfile2({required bool isphon}){
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                  children: [
                    Container(
                      // height: 200,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(isphon? 10 :padding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                            title: Text("Elvish Yadav",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text("29 Min",style: mediumGreyTextStyle,),
                            ),
                            leading: const CircleAvatar(backgroundImage: AssetImage("assets/avatar.png")),
                            trailing: SvgPicture.asset("assets/more-vertical.svg",height: 20,width: 20,color: appGreyColor),
                          ),
                              const SizedBox(height: 20,),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: isphon? 10 :padding),
                                child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: mediumGreyTextStyle,),
                              ),
                              const SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 250,
                                        decoration:  BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          image: const DecorationImage(image: AssetImage("assets/pexels-boys-in-bristol-photography-10528234.jpg"),fit: BoxFit.cover)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                               const SizedBox(height: 20,),
                               Padding(
                                 padding:  EdgeInsets.symmetric(horizontal: isphon? 10 :padding),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Lorem Ipsum is simply dummy text of the printing",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                                     const SizedBox(height: 8,),
                                     Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",style: mediumGreyTextStyle,),
                                   ],
                                 ),
                               ),
                              const SizedBox(height: 20,),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: isphon? 10 :padding),
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/heartfill.svg",color: appMainColor,height: 20,width: 20,),
                                    const SizedBox(width: 8,),
                                    Text("Like",style: mediumGreyTextStyle,),
                                    const Spacer(),
                                    Text("1k comment",style: mediumGreyTextStyle,),
                                    const SizedBox(width: 8,),
                                    Text("12 shares",style: mediumGreyTextStyle,),
                                  ],
                                ),
                              )


                        ]),
                      ),
                    )
                    
              ]),
            ),
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
              child: Column(
                  children: [
                    Container(
                      // height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(isphon? 10 :padding),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text("Fukra Insaan",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text("19 Min",style: mediumGreyTextStyle,),
                                ),
                                leading: const CircleAvatar(backgroundImage: AssetImage("assets/avatar1.png")),
                                trailing: SvgPicture.asset("assets/more-vertical.svg",height: 20,width: 20,color: appGreyColor),
                              ),
                              const SizedBox(height: 20,),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: isphon? 10 :padding),
                                child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: mediumGreyTextStyle,),
                              ),
                              const SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 250,
                                        decoration:  BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            image: const DecorationImage(image: AssetImage("assets/pexels-kelvin-valerio-810775.jpg"),fit: BoxFit.cover)
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Expanded(
                                      child: Container(
                                        height: 250,
                                        decoration:  BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            image: const DecorationImage(image: AssetImage("assets/pexels-kelvin-valerio-810775.jpg"),fit: BoxFit.cover)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20,),
                              // Padding(
                              //   padding:  EdgeInsets.symmetric(horizontal: isphon? 10 :padding),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       Text("Lorem Ipsum is simply dummy text of the printing",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                              //       const SizedBox(height: 8,),
                              //       Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",style: mediumGreyTextStyle,),
                              //     ],
                              //   ),
                              // ),
                              // const SizedBox(height: 20,),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: isphon? 10 :padding),
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/heartfill.svg",color: appMainColor,height: 20,width: 20,),
                                    const SizedBox(width: 8,),
                                    Text("Like",style: mediumGreyTextStyle,),
                                    const Spacer(),
                                    Text("1k comment",style: mediumGreyTextStyle,),
                                    const SizedBox(width: 8,),
                                    Text("12 shares",style: mediumGreyTextStyle,),
                                  ],
                                ),
                              )


                            ]),
                      ),
                    )

                  ]),
            ),
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
              child: Column(
                  children: [
                    Container(
                      // height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(isphon? 10 :padding),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text("Elvish Yadav",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text("29 Min",style: mediumGreyTextStyle,),
                                ),
                                leading: const CircleAvatar(backgroundImage: AssetImage("assets/avatar.png")),
                                trailing: SvgPicture.asset("assets/more-vertical.svg",height: 20,width: 20,color: appGreyColor),
                              ),
                              const SizedBox(height: 20,),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: isphon? 10 :padding),
                                child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: mediumGreyTextStyle,),
                              ),
                              const SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 250,
                                        decoration:  BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            image: const DecorationImage(image: AssetImage("assets/pexels-boys-in-bristol-photography-10528234.jpg"),fit: BoxFit.cover)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: isphon? 10 :padding),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Lorem Ipsum is simply dummy text of the printing",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                                    const SizedBox(height: 8,),
                                    Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",style: mediumGreyTextStyle,),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: isphon? 10 :padding),
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/heartfill.svg",color: appMainColor,height: 20,width: 20,),
                                    const SizedBox(width: 8,),
                                    Text("Like",style: mediumGreyTextStyle,),
                                    const Spacer(),
                                    Text("1k comment",style: mediumGreyTextStyle,),
                                    const SizedBox(width: 8,),
                                    Text("12 shares",style: mediumGreyTextStyle,),
                                  ],
                                ),
                              )


                            ]),
                      ),
                    )

                  ]),
            ),
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
              child: Column(
                  children: [
                    Container(
                      // height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(isphon? 10 :padding),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text("Fukra Insaan",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text("19 Min",style: mediumGreyTextStyle,),
                                ),
                                leading: const CircleAvatar(backgroundImage: AssetImage("assets/avatar1.png")),
                                trailing: SvgPicture.asset("assets/more-vertical.svg",height: 20,width: 20,color: appGreyColor),
                              ),
                              const SizedBox(height: 20,),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: isphon? 10 :padding),
                                child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: mediumGreyTextStyle,),
                              ),
                              const SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 250,
                                        decoration:  BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            image: const DecorationImage(image: AssetImage("assets/pexels-kelvin-valerio-810775.jpg"),fit: BoxFit.cover)
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Expanded(
                                      child: Container(
                                        height: 250,
                                        decoration:  BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            image: const DecorationImage(image: AssetImage("assets/pexels-kelvin-valerio-810775.jpg"),fit: BoxFit.cover)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20,),
                              // Padding(
                              //   padding:  EdgeInsets.symmetric(horizontal: isphon? 10 :padding),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       Text("Lorem Ipsum is simply dummy text of the printing",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                              //       const SizedBox(height: 8,),
                              //       Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",style: mediumGreyTextStyle,),
                              //     ],
                              //   ),
                              // ),
                              // const SizedBox(height: 20,),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: isphon? 10 :padding),
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/heartfill.svg",color: appMainColor,height: 20,width: 20,),
                                    const SizedBox(width: 8,),
                                    Text("Like",style: mediumGreyTextStyle,),
                                    const Spacer(),
                                    Text("1k comment",style: mediumGreyTextStyle,),
                                    const SizedBox(width: 8,),
                                    Text("12 shares",style: mediumGreyTextStyle,),
                                  ],
                                ),
                              )


                            ]),
                      ),
                    )

                  ]),
            ),
          ],
        ),
        const SizedBox(height: 15,),

      ],
    );
  }

  Widget _buildProfile1({required int count,required bool isphon }){
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                // height: 200,
                padding:  EdgeInsets.all(isphon? 10 :padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Deepika Padukone',style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),),
                     leading: const CircleAvatar(backgroundColor: Colors.transparent,backgroundImage: AssetImage("assets/avatar2.png")),
                      subtitle: const Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text("Celebrity",style: TextStyle(color: appGreyColor)),
                      ),
                      trailing: SvgPicture.asset("assets/settings.svg",height: 18,width: 18,color: appGreyColor),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              Text("1,908",style:  mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire.getMainText)),
                              const SizedBox(height: 5,),
                              Text("Posts",style: mediumGreyTextStyle,overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20, child: VerticalDivider(color: Colors.grey,width: 50)),
                        Flexible(
                          child: Column(
                            children: [
                              Text("34.0k",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire.getMainText)),
                              const SizedBox(height: 5,),
                              Text("Followers",style: mediumGreyTextStyle,overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20, child: VerticalDivider(color: Colors.grey,width: 50)),
                        Flexible(
                          child: Column(
                            children: [
                              Text("1400",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire.getMainText)),
                              const SizedBox(height: 5,),
                              Text("Following",style: mediumGreyTextStyle,overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25,),
                   Padding(
                     padding:  EdgeInsets.symmetric(horizontal: isphon? 10 :padding),
                     child: Column(
                       children: [
                         _buidcomunlisttile(title: "Went to: ", icon: "assets/calendar-empty-alt.svg", subtitle: "India"),
                         const SizedBox(height: 15,),
                         _buidcomunlisttile(title: "Worked at: ", icon: "assets/briefcase.svg", subtitle: "Company"),
                         const SizedBox(height: 15,),
                         _buidcomunlisttile(title: "Lives in: ", icon: "assets/home.svg", subtitle: "India,Gujarat"),
                         const SizedBox(height: 15,),
                         _buidcomunlisttile(title: "From: ", icon: "assets/location-pin.svg", subtitle: "Settle,WA"),
                         const SizedBox(height: 10,),
                       ],
                     ),
                   )
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
              child: Container(
                // height: 200,
                padding:  EdgeInsets.all(isphon? 10 :padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                ),
                child: Column(
                  children: [

                    Row(
                      children: [
                        Text("You Know these people ?",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                        const Spacer(),
                        SvgPicture.asset('assets/more-vertical.svg',height: 20,width: 20,color: notifire.getTextColor1),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    ListView.builder(
                      controller: ScrollController(),
                      physics: const BouncingScrollPhysics(),
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(name[index],style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),),
                        leading:  CircleAvatar(backgroundColor: Colors.transparent,backgroundImage: AssetImage(profile[index])),
                        subtitle:  Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(bio[index],style: const TextStyle(color: appGreyColor)),
                        ),
                        trailing: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: notifire.getcontiner,
                            ),
                            child: Center(child: SvgPicture.asset("assets/check.svg",height: 12,width: 12,color: appGreyColor))),
                      );
                    },),

                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
              child: Container(
                // height: 200,
                padding:  EdgeInsets.all(isphon? 10 :padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Friends",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                        const Spacer(),
                        Text("View all",style: mediumBlackTextStyle.copyWith(color: appMainColor),),
                      ],
                    ),
                    const SizedBox(height: 20,),

                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        ...List.generate(8, (index) => SizedBox(
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image:  DecorationImage(image: AssetImage(profile[index])),
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Text(name[index],style: mediumGreyTextStyle,overflow: TextOverflow.ellipsis,maxLines: 1,),
                            ],),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
              child: Container(
                // height: 200,
                padding: const EdgeInsets.all(padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                ),
                child: Column(
                  children: [

                    Row(
                      children: [
                        Text("Groups",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                        const Spacer(),
                        Text("View all",style: mediumBlackTextStyle.copyWith(color: appMainColor),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    ListView.builder(
                      controller: ScrollController(),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(name[index],style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),),
                          leading:  CircleAvatar(backgroundColor: Colors.transparent,backgroundImage: AssetImage(profile[index])),
                          subtitle:  Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(bio[index],style: const TextStyle(color: appGreyColor)),
                          ),
                        );
                      },),

                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
              child: Container(
                // height: 200,
                padding:  EdgeInsets.all(isphon? 10 :padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                ),
                child: Column(
                  children: [

                    Row(
                      children: [
                        Text("Links",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                        const Spacer(),
                        Text("View all",style: mediumBlackTextStyle.copyWith(color: appMainColor),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    ListView.builder(
                      controller: ScrollController(),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("Google",style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),),
                          leading:  CircleAvatar(backgroundColor: Colors.green,child: Text("G",style: mediumBlackTextStyle.copyWith(color: Colors.white),),),
                          subtitle:  const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text("www.google.com",style: TextStyle(color: appGreyColor)),
                          ),
                        );
                      },),

                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buidcomunlisttile({required String title,required String icon,required String subtitle}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(icon,height: 16,width: 16,color: appGreyColor),
        const SizedBox(width: 8,),
        RichText(text:
        TextSpan(children: [
          TextSpan(text: title,style: mediumGreyTextStyle),
          TextSpan(text: subtitle,style: mediumBlackTextStyle.copyWith(color: notifire.getMainText)),
        ]
        )
        )
      ],
    );
  }

  Widget _buidUi({required double width}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            children: [
              Expanded(
                child:
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 160,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: notifire.getcontiner),),
                    const Positioned(
                        left: 20,
                        bottom: -30,
                        child: CircleAvatar(radius: 55,backgroundColor: Colors.transparent,backgroundImage: AssetImage("assets/avatar.png"),)),
                  ],),
              ),
            ],
          ),
        ),
        const SizedBox(height: 35,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width<600 ? 10 :20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Elon Musk",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                  const SizedBox(width: 10,),
                  SvgPicture.asset("assets/Frame29.svg",height: 18,width: 18,),
                ],
              ),
              const SizedBox(height: 12,),
              Text("Elon Reeve Musk is a business magnate and investor. He is the founder",style: mediumGreyTextStyle,),
            ],
          ),
        ),
        const SizedBox(height: 12,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width<600 ? 10 :20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/briefcase.svg",width: 18,height: 18 ,color: appGreyColor),
                    const SizedBox(width: 8,),
                    Flexible(child: Text("Co-Founder,SpaceX",style: mediumBlackTextStyle.copyWith(color: appMainColor),overflow: TextOverflow.ellipsis)),
                  ],
                ),
              ),
              const SizedBox(width: 12,),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/location-pin.svg",width: 18,height: 18,color: appGreyColor),
                    const SizedBox(width: 8,),
                    Flexible(child: Text("Vivian Jenna Wilson",style: mediumBlackTextStyle.copyWith(color: appMainColor),overflow: TextOverflow.ellipsis)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding),
          child: Container(
            decoration: BoxDecoration(
            color: notifire.getcontiner,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child:width<400?
            Row(
              children: [
                TabBar(
                    controller: _tabController,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.zero,
                    isScrollable: true,
                    labelStyle: mediumBlackTextStyle,
                    indicatorColor: appMainColor,
                    labelColor: appMainColor,
                    unselectedLabelColor: notifire.getMainText,
                    unselectedLabelStyle: mediumBlackTextStyle,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                      Tab(text: "Profile",),
                      Tab(text: "NetWork",),
                      Tab(text: "SubScription",),
                    ]),
              ],
            ):
            Container(
              decoration: BoxDecoration(
                color: notifire.getcontiner,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 260,
                    child: TabBar(
                        controller: _tabController,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 15),
                        padding: EdgeInsets.zero,
                        isScrollable: true,
                        labelStyle: mediumBlackTextStyle,
                        indicatorColor: appMainColor,
                        labelColor: appMainColor,
                        unselectedLabelColor: notifire.getMainText,
                        unselectedLabelStyle: mediumBlackTextStyle,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: const [
                          Tab(text: "Profile",),
                          Tab(text: "NetWork",),
                          Tab(text: "SubScription",),
                        ]),
                  ),
                  const Spacer(),
                  SvgPicture.asset("assets/more-vertical.svg",height: 20,width: 20,color: notifire.getMainText,),
                ],
              ),
            ) ,
          ),
        ),

      ],
    );
  }

}
