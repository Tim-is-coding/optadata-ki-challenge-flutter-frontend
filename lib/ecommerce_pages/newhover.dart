// ignore_for_file: deprecated_member_use

import 'package:buzz/provider/proviercolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../appstaticdata/staticdata.dart';

class HoverAndPopup extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  final double width;
  const HoverAndPopup(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.width});

  @override
  HoverAndPopupState createState() => HoverAndPopupState();
}

class HoverAndPopupState extends State<HoverAndPopup> {
  double _animatedContainerHeight = 400;
  double _animatedContainerWidth = 1000;

  bool isanimated = false;
  bool _isHovered = false;
  bool istrue = false;
  bool istrue1 = false;
  bool istrue2 = false;

  int selectSize =0;
  int selectColor =0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            _animatedContainerHeight = 400;
            _animatedContainerWidth = 1000;
            _isHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            _animatedContainerHeight = 400;
            _animatedContainerWidth = 1000;
            _isHovered = false;
          });
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: _animatedContainerWidth,
            height: _animatedContainerHeight,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              color: _isHovered
                  ? Colors.black.withOpacity(0.3)
                  : Colors.transparent,
            ),
            child: _isHovered
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: SvgPicture.asset(
                                    "assets/shopping-cart.svg",
                                    height: 15,
                                    width: 15)),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              widget.width < 600
                                  ? _showMobileDialog()
                                  : _showMyDialog();
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: SvgPicture.asset("assets/eye.svg",
                                      height: 15, width: 15)),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: SvgPicture.asset("assets/heart.svg",
                                    height: 15, width: 15)),
                          ),
                        ],
                      )
                    ],
                  )
                : const SizedBox()),
      ),
    );
  }
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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return  StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: notifire!.getcontiner,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            elevation: 0,
            content: SingleChildScrollView(
              child: SizedBox(
                height: 460,
                width: 700,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 380,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(widget.image),fit: BoxFit.cover)
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 400,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: SvgPicture.asset(
                                            "assets/times.svg",
                                            width: 18,
                                            height: 18,
                                            color: Colors.grey,
                                          )),
                                    ],
                                  ),
                                  Text(
                                    widget.name,
                                    style:  TextStyle(
                                        color: notifire!.getMainText,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
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
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Text("Quantity", style: TextStyle(
                                          color: notifire!.getMainText,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  _buildcounter(),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    _buildaddbuttons(),
                  ],
                ),
              ),
            ),
          );
        },);


      },
    );
  }

  Future<void> _showMobileDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: notifire!.getcontiner,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            elevation: 0,
            content: SingleChildScrollView(
              child: SizedBox(
                height: 800,
                // width: 450,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              "assets/times.svg",
                              width: 18,
                              height: 18,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(widget.image),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.name,
                            style:  TextStyle(
                                color: notifire!.getMainText,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                          const SizedBox(
                            height: 25,
                          ),
                          Text("Quantity",
                              style: TextStyle(
                                  color: notifire!.getMainText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          const SizedBox(
                            height: 12,
                          ),
                          _buildcounter(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildaddbuttons(),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }



  Widget _buildcounter() {
    int counter = 0;

    return StatefulBuilder(builder: (context, setState) {
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
    });
  }

  Widget _buildaddbuttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromHeight(42),
              backgroundColor: Colors.white,
            ),
            child: Text(
              "Cancel",
              style: mediumBlackTextStyle.copyWith(
                  color: appMainColor, fontWeight: FontWeight.w200),
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
              "View Details",
              style: mediumBlackTextStyle.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w200),
            )),
      ],
    );
  }
}
