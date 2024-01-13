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
import '../staticdata.dart';

class PricingPage extends StatefulWidget {
  const PricingPage({Key? key}) : super(key: key);

  @override
  State<PricingPage> createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage>
    with SingleTickerProviderStateMixin {
  final AppConst controller = Get.put(AppConst());

  List title = [
    "Starter",
    "Enterprise",
    "Agency",
    "Diamond",
  ];
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
  }

  List logo = [
    "assets/agreement.svg",
    "assets/growth.svg",
    "assets/earning.svg",
    "assets/guarantee 1.svg",
  ];
  List price = [
    "\$29",
    "\$55",
    "\$29",
    "\$95",
  ];

  List colors = [
    Colors.brown.withOpacity(0.1),
    Colors.deepPurpleAccent.withOpacity(0.1),
    Colors.blueGrey.withOpacity(0.1),
    Colors.blue.withOpacity(0.1),
  ];

  bool istrue = false;
  bool ismonthly = false;

  bool value = false;
  bool value1 = false;
  bool value2 = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifire>(
      builder: (context, value, child) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: notifire!.getbgcolor,
        child: GetBuilder<AppConst>(builder: (controller) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 600) {
                controller.gridcounter.value = 1;
                // Mobile layout
                return NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        const SliverToBoxAdapter(child: ComunTitle(title: 'Pricing', path: "E-Commerce"),),
                        SliverToBoxAdapter(child: _buildui(count: 1),),
                        SliverToBoxAdapter(child: _buildui2(count: 1),),
                      ];
                    },
                    body: _tabbars(width: constraints.maxWidth));
              } else if (constraints.maxWidth < 1000) {
                controller.gridcounter.value = 2;
                return NestedScrollView(
                    physics: const BouncingScrollPhysics(),
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        const SliverToBoxAdapter(
                          child:
                              ComunTitle(title: 'Pricing', path: "E-Commerce"),
                        ),
                        SliverToBoxAdapter(
                          child: Row(
                            children: [
                              Expanded(
                                child: _buildui(count: 2),
                              ),
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Row(
                            children: [
                              Expanded(
                                child: _buildui2(count: 2),
                              ),
                            ],
                          ),
                        ),
                      ];
                    },
                    body: _tabbars(width: constraints.maxWidth));

                // Tablet layout
              } else {
                controller.gridcounter.value = 4;
                // Website layout
                return


                  SizedBox(
                  height: 1000,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const ComunTitle(title: 'Pricing', path: "E-Commerce"),
                        Row(
                          children: [
                            Expanded(
                              child: _buildui(count: 4),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: _buildui2(count: 4),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 500,
                          width: Get.width,
                          child: _tabbars(width: constraints.maxWidth),
                        ),
                        const SizeBoxx(),
                        const ComunBottomBar(),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        }),
      ),
    );
  }

  Widget _buildui({required int count}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Best ",
                style: mainTextStyle.copyWith(color: notifire!.getTextColor1)),
            TextSpan(
                text: "Plans ",
                style: mainTextStyle.copyWith(color: appMainColor)),
            TextSpan(
                text: "For Business",
                style: mainTextStyle.copyWith(color: notifire!.getTextColor1)),
          ])),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Cost - Effective, Full Service high Security",
            style: mediumGreyTextStyle.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Monthly",
                style:
                    mediumBlackTextStyle.copyWith(color: notifire!.getMainText),
              ),
              Switch(
                activeColor: appMainColor,
                value: ismonthly,
                onChanged: (value) {
                  setState(() {
                    ismonthly = value;
                  });
                },
              ),
              Text(
                "Yearly",
                style:
                    mediumBlackTextStyle.copyWith(color: notifire!.getMainText),
              ),
              count == 1
                  ? const SizedBox()
                  : const SizedBox(
                      width: 10,
                    ),
              count == 1
                  ? const SizedBox()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromHeight(30),
                          backgroundColor: appMainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {},
                      child: Text(
                        "30% discount",
                        style:
                            mediumBlackTextStyle.copyWith(color: Colors.white),
                      ))
            ],
          ),
          count == 1
              ? const SizedBox(
                  height: 10,
                )
              : const SizedBox(),
          count == 1
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(30),
                      backgroundColor: appMainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {},
                  child: Text(
                    "30% discount",
                    style: mediumBlackTextStyle.copyWith(color: Colors.white),
                  ))
              : const SizedBox(),
          // Divider(color: Colors.grey.shade300,height: 40),

          Obx(() {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: controller.gridcounter.value,
                  mainAxisExtent: 450),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(padding),
                  child: Container(
                    height: 200,
                    width: 200,
                    padding: const EdgeInsets.all(padding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      // border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      color: notifire!.getcontiner,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                logo[index],
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                title[index],
                                style: mediumBlackTextStyle.copyWith(
                                    color: notifire!.getTextColor1,
                                    fontSize: 18),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                              style: mediumGreyTextStyle.copyWith(
                                  height: 1.7, overflow: TextOverflow.ellipsis),
                              maxLines: 2),
                          const SizedBox(
                            height: 22,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: price[index],
                                style: mediumBlackTextStyle.copyWith(
                                    fontSize: 28,
                                    color: notifire!.getTextColor1)),
                            TextSpan(
                                text: ismonthly ? "/year" : "/mo",
                                style: mediumGreyTextStyle),
                          ])),
                          Divider(
                            height: 40,
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          _buildrow(title: "29 Admin Account"),
                          _buildrow(title: "30-day chat history"),
                          _buildrow(title: "Email reminders"),
                          _buildrow(title: "Email & chat support"),
                          _buildrow(title: "Template Library"),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          fixedSize: const Size.fromHeight(40),
                                          shadowColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor:
                                              Colors.grey.withOpacity(0.2)),
                                      child: Text(
                                        "GET STARTED",
                                        style: mediumBlackTextStyle.copyWith(
                                            color: notifire!.getTextColor1,
                                            letterSpacing: 2),
                                      ))),
                            ],
                          ),
                        ]),
                  ),
                );


              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildrow({required String title}) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/Frame55.svg",
              height: 18,
              width: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style:
                  mediumBlackTextStyle.copyWith(color: notifire!.getTextColor1),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }

  Widget _buildrow1({required String title}) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/check.svg",
                height: 12, width: 12, color: notifire!.getTextColor1),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style:
                  mediumBlackTextStyle.copyWith(color: notifire!.getTextColor1),
            ),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }

  Widget _buildui2({required int count}) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Best ",
                    style:
                        mainTextStyle.copyWith(color: notifire!.getTextColor1)),
                TextSpan(
                    text: "Plans ",
                    style: mainTextStyle.copyWith(color: appMainColor)),
                TextSpan(
                    text: "For Business",
                    style:
                        mainTextStyle.copyWith(color: notifire!.getTextColor1)),
              ])),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Cost - Effective, Full Service high Security",
                style: mediumGreyTextStyle.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 200,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                ),
                child: SizedBox(
                  height: 30,
                  child: TabBar(
                      unselectedLabelColor: appGreyColor,
                      unselectedLabelStyle: mediumBlackTextStyle,
                      labelStyle: mediumBlackTextStyle,
                      labelColor: Colors.white,
                      controller: _tabController,
                      indicator: const BoxDecoration(
                        color: appMainColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      tabs: const [
                        Tab(
                          text: "Monthly",
                        ),
                        Tab(
                          text: "Annual",
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabbars({required double width}) {
    return TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(padding, padding, padding, 0),
                  child: Obx(() {
                    return GridView.builder(
                      controller: ScrollController(keepScrollOffset: false),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: controller.gridcounter.value,
                        mainAxisExtent: 450,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(padding),
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.all(padding),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: colors[index],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      // SvgPicture.asset(logo[index],height: 30,width: 30,),
                                      // const SizedBox(width: 10,),
                                      Text(
                                        title[index],
                                        style: mediumBlackTextStyle.copyWith(
                                            color: notifire!.getTextColor1,
                                            fontSize: 18),
                                      )
                                    ],
                                  ),
                                  // const SizedBox(height: 12,),
                                  // Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.',style: mediumGreyTextStyle.copyWith(height: 1.7,overflow: TextOverflow.ellipsis),maxLines: 2),
                                  const SizedBox(
                                    height: 22,
                                  ),

                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: price[index],
                                        style: mediumBlackTextStyle.copyWith(
                                            fontSize: 35,
                                            color: notifire!.getTextColor1)),
                                    TextSpan(
                                        text: "/mo",
                                        style: mediumGreyTextStyle.copyWith(
                                            fontSize: 20)),
                                  ])),

                                  Divider(
                                    height: 40,
                                    color: Colors.grey.withOpacity(0.3),
                                  ),

                                  _buildrow1(title: "Up to 5 Users License"),
                                  _buildrow1(title: "Component properties"),
                                  _buildrow1(title: "interactive components"),
                                  _buildrow1(title: "Light & Dark theme"),
                                  _buildrow1(title: "Lifetime Updates"),
                                  _buildrow1(title: "8 Users License"),

                                  const SizedBox(
                                    height: 8,
                                  ),

                                  Row(
                                    children: [
                                      Expanded(
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  fixedSize:
                                                      const Size.fromHeight(40),
                                                  shadowColor: Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(20)),
                                                  backgroundColor:
                                                      const Color(0xff1c1c1c)),
                                              child: Text(
                                                "Choose Plan",
                                                style: mediumBlackTextStyle.copyWith(
                                                    color: Colors.white,
                                                    letterSpacing: 2),
                                              ))),
                                    ],
                                  ),
                                ]),
                          ),
                        );
                      },
                    );
                  }),
                ),
                width<1200? const SizeBoxx() : const SizedBox() ,
                width<1200?  const ComunBottomBar() : const SizedBox(),
              ],
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(padding, padding, padding, 0),
                  child: Obx(() {
                    return GridView.builder(
                      controller: ScrollController(keepScrollOffset: false),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: controller.gridcounter.value,
                        mainAxisExtent: 450,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(padding),
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.all(padding),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: colors[index],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      // SvgPicture.asset(logo[index],height: 30,width: 30,),
                                      // const SizedBox(width: 10,),
                                      Text(
                                        title[index],
                                        style: mediumBlackTextStyle.copyWith(
                                            color: notifire!.getTextColor1,
                                            fontSize: 18),
                                      )
                                    ],
                                  ),
                                  // const SizedBox(height: 12,),
                                  // Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.',style: mediumGreyTextStyle.copyWith(height: 1.7,overflow: TextOverflow.ellipsis),maxLines: 2),
                                  const SizedBox(
                                    height: 22,
                                  ),

                                  RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: price[index],
                                            style: mediumBlackTextStyle.copyWith(
                                                fontSize: 35,
                                                color: notifire!.getTextColor1)),
                                        TextSpan(
                                            text: "/Year",
                                            style: mediumGreyTextStyle.copyWith(
                                                fontSize: 20)),
                                      ])),

                                  Divider(
                                    height: 40,
                                    color: Colors.grey.withOpacity(0.3),
                                  ),

                                  _buildrow1(title: "Up to 5 Users License"),
                                  _buildrow1(title: "Component properties"),
                                  _buildrow1(title: "interactive components"),
                                  _buildrow1(title: "Light & Dark theme"),
                                  _buildrow1(title: "Lifetime Updates"),
                                  _buildrow1(title: "8 Users License"),

                                  const SizedBox(
                                    height: 8,
                                  ),

                                  Row(
                                    children: [
                                      Expanded(
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  fixedSize:
                                                  const Size.fromHeight(40),
                                                  shadowColor: Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(20)),
                                                  backgroundColor:
                                                  const Color(0xff1c1c1c)),
                                              child: Text(
                                                "Choose Plan",
                                                style: mediumBlackTextStyle.copyWith(
                                                    color: Colors.white,
                                                    letterSpacing: 2),
                                              ))),
                                    ],
                                  ),
                                ]),
                          ),
                        );
                      },
                    );
                  }),
                ),
                width<1200? const SizeBoxx() : const SizedBox() ,
                width<1200?  const ComunBottomBar() : const SizedBox(),
              ],
            ),
          ),

        ]);
  }
}


