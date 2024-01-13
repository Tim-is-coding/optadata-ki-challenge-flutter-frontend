
// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
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
import 'newhover.dart';


class ProductDetilsPage extends StatefulWidget {
  const ProductDetilsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetilsPage> createState() => _ProductDetilsPageState();
}

class _ProductDetilsPageState extends State<ProductDetilsPage> {
  bool istrue = false;

  var days;
  var hours;
  var minutes;
  var seconds;

  List size = [
    "S",
    "M",
    "L",
    "XL",
  ];
  List color =[
    const Color(0xff715445),
    const Color(0xffdcd5c3),
    const Color(0xffa4a4a4),
    const Color(0xff4b4849),
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }
  final AppConst controller = Get.put(AppConst());

  TextEditingController projecttitle = TextEditingController();
  TextEditingController clientname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    days = strDigits(myDuration.inDays);
    hours = strDigits(myDuration.inHours.remainder(24));
    minutes = strDigits(myDuration.inMinutes.remainder(60));
    seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Consumer<ColorNotifire>(

      builder: (context, value, child) =>  Container(
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
              return NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  const SliverToBoxAdapter(child: ComunTitle(title: 'Product Page',path: "E-Commerce"),),
                  SliverToBoxAdapter(child: _buildimageselction(width: constraints.maxWidth),),
                  SliverToBoxAdapter(child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: _builddetils(),
                  ),),
                  SliverToBoxAdapter(child: _buildtabviewandbar(),),
                ];
              }, body: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 1000,
                      child: _buildgridview(width: constraints.maxWidth,count: 1),
                    ),
                  ),
                ],
              ),);


            } else if (constraints.maxWidth < 1200) {
              if(constraints.maxWidth<1000){
                return SizedBox(
                  height: 1000,
                  width: double.infinity,

                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const ComunTitle(title: 'Product Page',path: "E-Commerce"),
                        Row(
                          children: [

                            Expanded(
                              child: _buildimageselction(width: constraints.maxWidth),
                            ),



                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: _builddetils(),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: _buildtabviewandbar(),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 800,
                                child: _buildgridview(width: constraints.maxWidth,count: 2),
                              ),
                            ),
                          ],
                        ),

                        const SizeBoxx(),
                        const ComunBottomBar(),
                      ],
                    ),
                  ),
                );

              }else{
                return SizedBox(
                  height: 1000,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const ComunTitle(title: 'Product Page',path: "E-Commerce"),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: _buildimageselction(width: constraints.maxWidth),
                            ),

                            Expanded(
                              flex: 4,
                              child: _builddetils(),
                            ),

                            // Expanded(
                            //   flex: 2,
                            //   child: _buildbarddetils(),
                            // ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: _buildtabviewandbar(),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 800,
                                child: _buildgridview(width: constraints.maxWidth,count: 3),
                              ),
                            ),
                          ],
                        ),
                        const SizeBoxx(),
                        const ComunBottomBar(),
                      ],
                    ),
                  ),
                );
              }
              // Tablet layout
            } else {
              // Website layout
              return SizedBox(
                height: 1000,
                width: double.infinity,

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ComunTitle(title: 'Product Page',path: "E-Commerce"),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: _buildimageselction(width: constraints.maxWidth),
                          ),
                          Expanded(
                            flex: 4,
                            child: _builddetils(),
                          ),

                          // Expanded(
                          //   flex: 2,
                          //   child: _buildbarddetils(),
                          // ),

                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _buildtabviewandbar(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text("Related Product",style: mainTextStyle.copyWith(color: notifire!.getMainText),),
                      ),
                      const SizedBox(height: 8,),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 400,
                              child: _buildgridview(width: constraints.maxWidth,count: 4),
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildgridview({required double width,required int count}) {
    return  GridView.builder(
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: count, mainAxisExtent: 400),
          itemCount: 4,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(padding),
            child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: notifire!.getcontiner,
              boxShadow: boxShadow,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: InkWell(
                      onTap: () {},
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            // color: Colors.deepPurple,
                            height: 400,
                            width: 400,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      controller.productimage[index]),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 10,
                            child: Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white.withOpacity(0.8)),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/fire.svg",color: Colors.deepPurpleAccent,width: 20,height: 20,),
                                  const SizedBox(width: 8,),
                                  Text("New",style: mediumBlackTextStyle,),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 10,
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white.withOpacity(0.8)),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/bolt.svg",color: Colors.deepOrange,height: 20,width: 20,),
                                  const SizedBox(width: 8,),
                                  Text(
                                    '$hours:$minutes:$seconds',
                                    style: mediumBlackTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          HoverAndPopup(
                            image: controller.productimage[index],
                            name: controller.prodectname[index],
                            price: controller.prodectprice[index],
                            width: width,
                          ),
                        ],
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const SizedBox(height: 10,),

                          Text(controller.prodectname[index], style: mediumGreyTextStyle.copyWith(fontSize: 13), overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 3,),
                          Text(controller.prodectdiscription[index], style: mainTextStyle.copyWith(fontSize: 17, color: notifire!.getMainText), overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Text(controller.prodectprice[index], style: mainTextStyle.copyWith(fontSize: 17).copyWith(color: appGreyColor,decoration: TextDecoration.lineThrough), overflow: TextOverflow.ellipsis),
                              const SizedBox(width: 8,),
                              Text(controller.prodectprice[index], style: mainTextStyle.copyWith(fontSize: 17).copyWith(color: appMainColor), overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Timer? countdownTimer;

  Duration myDuration = const Duration(days: 5);

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }
  void setCountDown() {
    const reduceSecondsBy = 1;
    if (!mounted) return;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  String strDigits(int n) => n.toString().padLeft(2, '0');


  Widget _buildimageselction({required double width}){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: width<600? 350:550,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            CarouselSlider(
              items: [
                _buildimage(image: "assets/portrait-expressive-young-woman-holding-shopping-bags.jpg"),
                _buildimage(image: "assets/portrait-payment-white-happy-consumer.jpg"),
                _buildimage(image: "assets/pexels-pixabay-220453.jpg"),
                _buildimage(image: "assets/pexels-kelvin-valerio-810775.jpg"),
              ],
              //Slider Container properties
              options: CarouselOptions(
                height: width<600? 300:550,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ],
        )
      ),
    );
  }
    int counter = 0;
  Widget _buildcounter() {
    return Consumer<ColorNotifire>(
      builder: (context, value, child) => Container(
        height: 35,
        width: 120,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: notifire!.getbordercolor,
            borderRadius: BorderRadius.circular(14)),
        child:
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      if (counter > 0) {
                        counter--;
                      }
                    });
                  },
                  child: Image.asset("assets/ic_minus_top.png")),
              Text("$counter", style: mediumBlackTextStyle.copyWith(fontSize: 18,color: notifire!.getMainText)),
              InkWell(
                  onTap: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: Image.asset("assets/ic_plus_top.png")),
            ]),
      ),
    );
  }
  int selectSize = 0;
  int selectColor = 0;
  Widget _buildaddbuttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromHeight(42),
              backgroundColor: appMainColor,
            ),
            child: Text(
              "Add to Cart",
              style: mediumBlackTextStyle.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w200),
            )),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromHeight(42),
              backgroundColor: appMainColor,
            ),
            child: Text(
              "Wish List",
              style: mediumBlackTextStyle.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w200),
            )),
      ],
    );
  }
  Widget _builddetils(){
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            // height: 580,
            decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
            child:   Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                     Text("Women Pink shirt.",style: mainTextStyle.copyWith(fontSize: 22,color: notifire!.getMainText),overflow: TextOverflow.ellipsis),

                    const SizedBox(height: 12,),
                     Row(
                      children: [
                        Text("\$26.00",style: mainTextStyle.copyWith(fontSize: 19).copyWith(color: appMainColor),overflow: TextOverflow.ellipsis),
                        const SizedBox(width: 12,),
                        Text("\$350.00",style: mediumGreyTextStyle.copyWith(fontSize: 15).copyWith(decoration: TextDecoration.lineThrough),overflow: TextOverflow.ellipsis)
                      ],
                    ),
                    const SizedBox(height: 12,),

                    Text(
                      "Size",
                      style: TextStyle(
                          color: notifire!.getMainText,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 50,
                      width: Get.width*04,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: size.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectSize=index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color:selectSize==index? Colors.grey.withOpacity(0.3):Colors.transparent),
                                  color: Colors.transparent,
                                ),
                                child: Center(child: Text(size[index],style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),)),
                              ),
                            ),
                          );
                        },),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    Text(
                      "Colors",
                      style: TextStyle(
                          color: notifire!.getMainText,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 50,
                      width: Get.width*04,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: size.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectColor=index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: 50,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color:selectColor==index? Colors.grey.withOpacity(0.3):Colors.transparent),
                                  color: Colors.transparent,
                                ),
                                child: Center(child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: color[index],
                                  ),
                                )),
                              ),
                            ),
                          );
                        },),
                    ),
                    const SizedBox(height: 15,),
                    Text("Quantity", style: TextStyle(
                        color: notifire!.getMainText,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                    const SizedBox(height: 20,),
                    _buildcounter(),
                    const SizedBox(height: 20,),
                    _buildaddbuttons(),
                    const SizedBox(height: 35,),
                    Text("Delivery", style: TextStyle(
                        color: notifire!.getMainText,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: 300,
                            child: TextField(
                              style: mediumGreyTextStyle,
                              decoration: InputDecoration(
                                prefixIcon: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Center(child: SvgPicture.asset("assets/location-pin.svg",height: 20,width: 20,color: appMainColor))),
                                hintStyle: mediumGreyTextStyle,
                                hintText: "394101",
                                enabledBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(12)),borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
                                disabledBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(12)),borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
                                border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(12)),borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: appMainColor,
                              fixedSize: const Size.fromHeight(40),
                            ),
                            onPressed: () {}, child: Text("Check",style: mediumBlackTextStyle.copyWith(color: Colors.white),))
                      ],
                    )


                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _buildtabviewandbar(){
    return DefaultTabController(length: 3, child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

              SizedBox(
              // height: 80,
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: appMainColor,
                      tabs: [
                        Tab( child: Text("FEBRIC",style: mainTextStyle.copyWith(fontSize: 13,color: notifire!.getMainText),),),
                        Tab( child: Text("VIDEO",style: mainTextStyle.copyWith(fontSize: 13,color: notifire!.getMainText),),),
                        Tab( child: Text("DETAILS",style: mainTextStyle.copyWith(fontSize: 13,color: notifire!.getMainText),),),
                        // Tab( child: Text("BRAND",style: mainTextStyle.copyWith(fontSize: 13,color: notifire!.getMainText),),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                height: 100,
                child:   TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",style: mediumGreyTextStyle.copyWith(height: 1.5,fontSize: 15)),
                          const SizedBox(height: 15,),

                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",style: mediumGreyTextStyle.copyWith(height: 1.5,fontSize: 15)),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.".tr,style: mediumGreyTextStyle.copyWith(height: 1.5,fontSize: 15)),
                          const SizedBox(height: 15,),
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",style: mediumGreyTextStyle.copyWith(height: 1.5,fontSize: 15)),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",style: mediumGreyTextStyle.copyWith(height: 1.5,fontSize: 15)),
                          const SizedBox(height: 15,),

                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",style: mediumGreyTextStyle.copyWith(height: 1.5,fontSize: 15)),
                        ],
                      ),
                    ),
                    // SingleChildScrollView(
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",style: mediumGreyTextStyle.copyWith(height: 1.5,fontSize: 15)),
                    //       const SizedBox(height: 15,),
                    //
                    //       Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",style: mediumGreyTextStyle.copyWith(height: 1.5,fontSize: 15)),
                    //     ],
                    //   ),
                    // ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }



  Widget _buildimage({required String image}){
    return    Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image:  DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

