// ignore_for_file: deprecated_member_use

import 'package:buzz/appstaticdata/staticdata.dart';
import 'package:buzz/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Widgets/comuntitle.dart';
import 'Widgets/sizebox.dart';
import 'comunbottombar.dart';
import 'provider/proviercolors.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  bool istrue = false;
  final AppConst controller = Get.put(AppConst());

  List titles = [
    "View all",
    "Doing",
    "Done",
  ];
  List cardlogo = [
    "assets/icons8-flutter.svg",
    "assets/icons8-java.svg",
    "assets/icons8-nodejs.svg",
    "assets/icons8-dart.svg",
    "assets/icons8-flutter.svg",
    "assets/icons8-java.svg",
    "assets/icons8-nodejs.svg",
    "assets/icons8-dart.svg",
  ];

  List cardname =[
    "Flutter Dev",
    "Java Dev",
    "Nodejs Dev",
    "Dart Dev",
    "Flutter Dev",
    "Java Dev",
    "Nodejs Dev",
    "Dart Dev",
  ];
  int titleselecter = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppConst>(builder: (controller) {
      return Consumer<ColorNotifire>(
        builder: (context, value, child) {
          return DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: notifire!.getbgcolor,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth < 600) {
                    // Mobile layout
                    return NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        const SliverToBoxAdapter(child: ComunTitle(title: 'Project List', path: "Project"),),
                        SliverToBoxAdapter(child: _buildphontabbar(),),
                        SliverToBoxAdapter(child:  Padding(padding: const EdgeInsets.fromLTRB(15, 0, 15, 0), child: _buildsearchbar(isphon: true,width: constraints.maxWidth),),),
                      ];
                    }, body: _buildTabview(size: 1));




                  } else if (constraints.maxWidth < 1200) {
                    return NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        const SliverToBoxAdapter(child: ComunTitle(title: 'Project List', path: "Project"),),
                        SliverToBoxAdapter(child:  Padding(padding: const EdgeInsets.all(padding), child: Row(children: [Expanded(child: _buildTabbar(),),],),),),
                        SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.fromLTRB(15, 0, 15, 0), child: _buildsearchbar(isphon: constraints.maxWidth<800? true : false,width: constraints.maxWidth),),),
                      ];

                    }, body: Row(children: [Expanded(child: _buildTabview(size: 2)),],),);



                    // Tablet layout
                  } else {
                    // Website layout
                    return NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) {

                      return [
                        const SliverToBoxAdapter(child: ComunTitle(title: 'Project List', path: "Project"),),
                        SliverToBoxAdapter(child:  Padding(padding: const EdgeInsets.all(padding), child: Row(children: [Expanded(child: _buildTabbar(),),],),),),
                        SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.fromLTRB(15, 0, 15, 0), child: _buildsearchbar(isphon: false,width: constraints.maxWidth),),),
                      ];
                    }, body:   Row(
                      children: [
                        Expanded(child: _buildTabview(size: 4))
                        ,],),);


                  }
                },
              ),
            ),
          );
        },
      );
    });
  }

  Widget _buildsearchbar({required bool isphon,required double width}) {
    return width<400?

    Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  // width: 200,
                  child: Center(
                    child: TextField(
                      style: mediumBlackTextStyle.copyWith(
                          color: notifire!.getMainText),
                      decoration: InputDecoration(
                        hintText: "Search..",
                        isDense: true,
                        suffixIcon: SizedBox(
                            height: 20,
                            width: 20,
                            child: Center(
                                child: SvgPicture.asset(
                                  "assets/search.svg",
                                  height: 20,
                                  width: 20,
                                  color: appGreyColor,
                                ))),
                        hintStyle: mediumGreyTextStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3))),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3))),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Container(
            height: 40,
            width: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                Border.all(color: Colors.grey.withOpacity(0.3))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/filter.svg",
                  height: 20,
                  width: 20,
                  color: appGreyColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Filter",
                  style: mediumBlackTextStyle.copyWith(
                      color: notifire!.getMainText),
                ),
                const SizedBox(
                  height: 20,
                  child:
                  VerticalDivider(color: appGreyColor, width: 30),
                ),
                Text("2",
                    style: mediumBlackTextStyle.copyWith(
                        color: Colors.blueAccent)),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: 50,
            width: 280,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: titles.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      titleselecter = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: titleselecter == index
                                  ? appMainColor
                                  : Colors.grey.withOpacity(0.3))),
                      child: Center(
                          child: Text(
                            titles[index],
                            style: mediumBlackTextStyle.copyWith(
                                color: titleselecter == index
                                    ? appMainColor
                                    : notifire!.getMainText),
                          )),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    )
        :isphon
        ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding),
          child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 200,
                      child: Center(
                        child: TextField(
                          style: mediumBlackTextStyle.copyWith(
                              color: notifire!.getMainText),
                          decoration: InputDecoration(
                            hintText: "Search..",
                            isDense: true,
                            suffixIcon: SizedBox(
                                height: 20,
                                width: 20,
                                child: Center(
                                    child: SvgPicture.asset(
                                  "assets/search.svg",
                                  height: 20,
                                  width: 20,
                                  color: appGreyColor,
                                ))),
                            hintStyle: mediumGreyTextStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.3))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.3))),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.3))),
                          ),
                        ),
                      ),
                    ),
                   const Spacer(),
                    Container(
                      height: 40,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/filter.svg",
                            height: 20,
                            width: 20,
                            color: appGreyColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Filter",
                            style: mediumBlackTextStyle.copyWith(
                                color: notifire!.getMainText),
                          ),
                          const SizedBox(
                            height: 20,
                            child:
                                VerticalDivider(color: appGreyColor, width: 30),
                          ),
                          Text("2",
                              style: mediumBlackTextStyle.copyWith(
                                  color: Colors.blueAccent)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 50,
                  width: 280,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: titles.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            titleselecter = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: titleselecter == index
                                        ? appMainColor
                                        : Colors.grey.withOpacity(0.3))),
                            child: Center(
                                child: Text(
                                  titles[index],
                                  style: mediumBlackTextStyle.copyWith(
                                      color: titleselecter == index
                                          ? appMainColor
                                          : notifire!.getMainText),
                                )),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
        )
        : Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding),
          child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 200,
                  child: Center(
                    child: TextField(
                      style: mediumBlackTextStyle.copyWith(
                          color: notifire!.getMainText),
                      decoration: InputDecoration(
                        hintText: "Search..",
                        isDense: true,
                        suffixIcon: SizedBox(
                            height: 20,
                            width: 20,
                            child: Center(
                                child: SvgPicture.asset(
                              "assets/search.svg",
                              height: 20,
                              width: 20,
                              color: appGreyColor,
                            ))),
                        hintStyle: mediumGreyTextStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.withOpacity(0.3))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.withOpacity(0.3))),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.withOpacity(0.3))),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.3))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/filter.svg",
                        height: 20,
                        width: 20,
                        color: appGreyColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Filter",
                        style: mediumBlackTextStyle.copyWith(
                            color: notifire!.getMainText),
                      ),
                      const SizedBox(
                        height: 20,
                        child: VerticalDivider(color: appGreyColor, width: 30),
                      ),
                      Text("2",
                          style: mediumBlackTextStyle.copyWith(
                              color: Colors.blueAccent)),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 50,
                  width: 280,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: titles.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            titleselecter = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: titleselecter == index
                                        ? appMainColor
                                        : Colors.grey.withOpacity(0.3))),
                            child: Center(
                                child: Text(
                              titles[index],
                              style: mediumBlackTextStyle.copyWith(
                                  color: titleselecter == index
                                      ? appMainColor
                                      : notifire!.getMainText),
                            )),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
        );
  }

  Widget _buildTabbar() {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 300,
            child: TabBar(
              padding: EdgeInsets.zero,
              isScrollable: true,
              indicatorSize:  TabBarIndicatorSize.label,
              labelStyle: TextStyle(color: notifire!.getMainText, fontSize: 14,),
              unselectedLabelColor: notifire!.getMainText,
              labelColor: appMainColor,
              labelPadding: const EdgeInsets.only(right: 30),
              indicatorColor: appMainColor,
              tabs: const [
                Tab(text: "View All"),
                Tab(text: "Most Recent"),
                Tab(text: "Popular"),
              ],
            ),
          ),
         const Spacer(),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: notifire!.getcontiner,
                  fixedSize: const Size.fromHeight(35),
                  elevation: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/users.svg",
                      color: notifire!.getTextColor1, width: 18, height: 18),
                  const SizedBox(
                    width: 10,
                  ),
                   Text(
                    "Share",
                    style: TextStyle(
                        color: notifire!.getMainText,
                        fontSize: 14,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              )),
          const SizedBox(
            width: 8,
          ),
          ElevatedButton(
              onPressed: () {
                controller.changePage(5);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: appMainColor,
                  fixedSize: const Size.fromHeight(35),
                  elevation: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/plus-circle.svg",
                      color: Colors.white, width: 18, height: 18),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Create",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              )),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildphontabbar() {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: SizedBox(
          height: 140,
          // decoration: BoxDecoration(
          //   borderRadius: const BorderRadius.all(Radius.circular(12)),
          //   color: notifire!.getcontiner,
          //   boxShadow: boxShadow,
          // ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  child: TabBar(
                    padding: EdgeInsets.zero,
                    isScrollable: true,
                    indicatorSize:  TabBarIndicatorSize.label,
                    labelStyle: TextStyle(color: notifire!.getMainText, fontSize: 14,),
                    unselectedLabelColor: notifire!.getMainText,
                    labelColor: appMainColor,
                    labelPadding: const EdgeInsets.only(right: 30),
                    indicatorColor: appMainColor,
                    tabs: const [
                      Tab(text: "View All"),
                      Tab(text: "Most Recent"),
                      Tab(text: "Popular"),
                    ],
                  ),
                ),
                const Expanded(
                    child: SizedBox(
                  height: 10,
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          controller.changePage(5);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: notifire!.getcontiner,
                            fixedSize: const Size.fromHeight(35),
                            elevation: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/users.svg",
                                color: notifire!.getTextColor1, width: 18, height: 18),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Share",
                              style: TextStyle(
                                  color: notifire!.getMainText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        )),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            controller.changePage(5);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: appMainColor,
                              fixedSize: const Size.fromHeight(35),
                              elevation: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset("assets/plus-circle.svg",
                                  color: Colors.white, width: 18, height: 18),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text("Create New",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  overflow: TextOverflow.ellipsis),
                            ],
                          )),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
  Widget _buildTabview({required int size}) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: notifire!.getbgcolor,
        boxShadow: boxShadow,
      ),
      child: SizedBox(
        // height: 700,
        child: TabBarView(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
                    child: GridView.builder(
                      shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size, mainAxisExtent: 350),
                      itemCount: cardlogo.length,
                      itemBuilder: (context, index) {
                        return  Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),color: notifire!.getcontiner,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(padding),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Row(
                                         children: [
                                         const CircleAvatar(radius: 5,backgroundColor: appMainColor,),
                                         const SizedBox(width: 8,),
                                         Text("Doing",style: mediumBlackTextStyle.copyWith(color: notifire!.getTextColor1),),
                                         const Spacer(),
                                         SvgPicture.asset("assets/rotate-right.svg",height: 20,width: 20,color: appGreyColor,),
                                         const SizedBox(width: 8,),
                                         SvgPicture.asset("assets/more-vertical.svg",height: 20,width: 20,color: appGreyColor,),
                                       ],),
                                       const SizedBox(height: 10,),
                                        CircleAvatar(radius: 45,backgroundColor: Colors.white,child: Center(child: SvgPicture.asset(cardlogo[index])),),
                                       const SizedBox(height: 10,),
                                       Text(cardname[index],style: mediumBlackTextStyle.copyWith(color: notifire!.getTextColor1,fontSize: 16),),
                                       const SizedBox(height: 10,),
                                       const Stack(
                                         alignment: Alignment.topLeft,
                                         children: [
                                           CircleAvatar(
                                               radius: 15,
                                               backgroundColor: Colors.transparent,
                                               backgroundImage: AssetImage(
                                                   "assets/Item10.png")),
                                           Padding(
                                             padding: EdgeInsets.only(left: 20),
                                             child: CircleAvatar(
                                                 radius: 15,
                                                 backgroundColor:
                                                 Colors.transparent,
                                                 backgroundImage: AssetImage(
                                                     "assets/Item5.png")),
                                           ),
                                           Padding(
                                             padding: EdgeInsets.only(left: 40),
                                             child: CircleAvatar(
                                                 radius: 15,
                                                 backgroundColor: Colors.yellow,
                                                 backgroundImage: AssetImage(
                                                     "assets/avatar1.png")),
                                           ),
                                         ],
                                       ),
                                       const SizedBox(height: 20,),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           SvgPicture.asset("assets/file-list.svg",height: 18,width: 18,color: appGreyColor),
                                           const SizedBox(width: 40,),
                                           SvgPicture.asset("assets/users.svg",height: 18,width: 18,color: appGreyColor),
                                           const SizedBox(width: 40,),
                                           SvgPicture.asset("assets/trash.svg",height: 18,width: 18,color: appGreyColor),

                                         ],
                                       ),
                                       const SizedBox(height: 20,),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Column(
                                             children: [
                                               Text("\$2,955",style: mediumBlackTextStyle.copyWith(color: notifire!.getTextColor1,fontSize: 16),),
                                               const SizedBox(height: 8,),
                                               Text("\$Budget",style: mediumGreyTextStyle,),
                                             ],
                                           ),
                                           const SizedBox(width: 20,),
                                           Column(
                                             children: [
                                               Text("\$29",style: mediumBlackTextStyle.copyWith(color: notifire!.getTextColor1,fontSize: 16),),
                                               const SizedBox(height: 8,),
                                               Text("\$Delay",style: mediumGreyTextStyle,),
                                             ],
                                           ),
                                         ],
                                       )
                                     ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        );

                      },
                    ),
                  ),
                  SizedBox(height: Get.width*0.05,), const SizeBoxx(),
                  const ComunBottomBar(),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
                    child: GridView.builder(
                      shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size, mainAxisExtent: 350),
                      itemCount: cardlogo.length,
                      itemBuilder: (context, index) {
                        return  Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),color: notifire!.getcontiner,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(padding),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          const CircleAvatar(radius: 5,backgroundColor: Colors.green,),
                                          const SizedBox(width: 8,),
                                          Text("Done",style: mediumBlackTextStyle.copyWith(color: notifire!.getTextColor1),),
                                          const Spacer(),
                                          SvgPicture.asset("assets/rotate-right.svg",height: 20,width: 20,color: appGreyColor,),
                                          const SizedBox(width: 8,),
                                          SvgPicture.asset("assets/more-vertical.svg",height: 20,width: 20,color: appGreyColor,),
                                        ],),
                                      const SizedBox(height: 10,),
                                      CircleAvatar(radius: 45,backgroundColor: Colors.white,child: Center(child: SvgPicture.asset(cardlogo[index])),),
                                      const SizedBox(height: 10,),
                                      Text(cardname[index],style: mediumBlackTextStyle.copyWith(color: notifire!.getTextColor1,fontSize: 16),),
                                      const SizedBox(height: 10,),
                                      const Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Colors.transparent,
                                              backgroundImage: AssetImage(
                                                  "assets/Item10.png")),
                                          Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor:
                                                Colors.transparent,
                                                backgroundImage: AssetImage(
                                                    "assets/Item5.png")),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 40),
                                            child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.yellow,
                                                backgroundImage: AssetImage(
                                                    "assets/avatar1.png")),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset("assets/file-list.svg",height: 18,width: 18,color: appGreyColor),
                                          const SizedBox(width: 40,),
                                          SvgPicture.asset("assets/users.svg",height: 18,width: 18,color: appGreyColor),
                                          const SizedBox(width: 40,),
                                          SvgPicture.asset("assets/trash.svg",height: 18,width: 18,color: appGreyColor),

                                        ],
                                      ),
                                      const SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text("\$2,955",style: mediumBlackTextStyle.copyWith(color: notifire!.getTextColor1,fontSize: 16),),
                                              const SizedBox(height: 8,),
                                              Text("\$Budget",style: mediumGreyTextStyle,),
                                            ],
                                          ),
                                          const SizedBox(width: 20,),
                                          Column(
                                            children: [
                                              Text("\$29",style: mediumBlackTextStyle.copyWith(color: notifire!.getTextColor1,fontSize: 16),),
                                              const SizedBox(height: 8,),
                                              Text("\$Delay",style: mediumGreyTextStyle,),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        );

                      },
                    ),
                  ),
                  SizedBox(height: Get.width*0.05,), const SizeBoxx(),
                  const ComunBottomBar(),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size, mainAxisExtent: 350),
                      itemCount: cardlogo.length,
                      itemBuilder: (context, index) {
                        return  Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),color: notifire!.getcontiner,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(padding),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                           CircleAvatar(radius: 5,backgroundColor : index == 2 | 3 ? Colors.green : appMainColor,),
                                          const SizedBox(width: 8,),
                                          Text(index == 2 | 3? "Done" :"Doing",style: mediumBlackTextStyle.copyWith(color: notifire!.getTextColor1),),
                                          const Spacer(),
                                          SvgPicture.asset("assets/rotate-right.svg",height: 20,width: 20,color: appGreyColor,),
                                          const SizedBox(width: 8,),
                                          SvgPicture.asset("assets/more-vertical.svg",height: 20,width: 20,color: appGreyColor,),
                                        ],),
                                      const SizedBox(height: 10,),
                                      CircleAvatar(radius: 45,backgroundColor: Colors.white,child: Center(child: SvgPicture.asset(cardlogo[index])),),
                                      const SizedBox(height: 10,),
                                      Text(cardname[index],style: mediumBlackTextStyle.copyWith(color: notifire!.getTextColor1,fontSize: 16),),
                                      const SizedBox(height: 10,),
                                      const Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Colors.transparent,
                                              backgroundImage: AssetImage(
                                                  "assets/Item10.png")),
                                          Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor:
                                                Colors.transparent,
                                                backgroundImage: AssetImage(
                                                    "assets/Item5.png")),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 40),
                                            child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.yellow,
                                                backgroundImage: AssetImage(
                                                    "assets/avatar1.png")),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset("assets/file-list.svg",height: 18,width: 18,color: appGreyColor),
                                          const SizedBox(width: 40,),
                                          SvgPicture.asset("assets/users.svg",height: 18,width: 18,color: appGreyColor),
                                          const SizedBox(width: 40,),
                                          SvgPicture.asset("assets/trash.svg",height: 18,width: 18,color: appGreyColor),

                                        ],
                                      ),
                                      const SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text("\$2,955",style: mediumBlackTextStyle.copyWith(color: notifire!.getTextColor1,fontSize: 16),),
                                              const SizedBox(height: 8,),
                                              Text("\$Budget",style: mediumGreyTextStyle,),
                                            ],
                                          ),
                                          const SizedBox(width: 20,),
                                          Column(
                                            children: [
                                              Text("\$29",style: mediumBlackTextStyle.copyWith(color: notifire!.getTextColor1,fontSize: 16),),
                                              const SizedBox(height: 8,),
                                              Text("\$Delay",style: mediumGreyTextStyle,),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        );

                      },
                    ),
                  ),
                  SizedBox(height: Get.width*0.05,), const SizeBoxx(),
                  const ComunBottomBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
