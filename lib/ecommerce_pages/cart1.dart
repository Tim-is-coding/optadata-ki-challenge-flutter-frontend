// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/sizebox.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';
import '../provider/proviercolors.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool istrue = false;

  TextEditingController projecttitle = TextEditingController();
  TextEditingController clientname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifire>(
      builder: (context, value, child) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: notifire!.getbgcolor,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) {
              // Mobile layout
              return SizedBox(
                height: 900,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Cart', path: "E-Commerce"),
                      Padding(
                        padding: const EdgeInsets.all(padding),
                        child: _buildcart(size: constraints.maxWidth),
                      ),
                      const SizeBoxx(),
                      const ComunBottomBar(),
                    ],
                  ),
                ),
              );
            } else if (constraints.maxWidth < 1200) {
              return SizedBox(
                height: 1000,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Cart', path: "E-Commerce"),
                      Padding(
                        padding: const EdgeInsets.all(padding),
                        child: _buildcart(size: constraints.maxWidth),
                      ),
                      const SizeBoxx(),
                      const ComunBottomBar(),
                    ],
                  ),
                ),
              );

              // Tablet layout
            } else {
              // Website layout
              return SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Cart', path: "E-Commerce"),
                      Padding(
                        padding: const EdgeInsets.all(padding),
                        child: _buildcart(size: constraints.maxWidth),
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

  int counter1 = 0;
  int counter2 = 0;
  int counter3 = 0;

  void counterfun() {
    setState(() {
      counter1++;
    });
  }

  void counterfun1() {
    setState(() {
      counter2++;
    });
  }

  void counterfun2() {
    setState(() {
      counter3++;
    });
  }

  void decrimant() {
    setState(() {
      if (counter1 > 0) {
        counter1--;
      }
    });
  }

  void decrimant1() {
    setState(() {
      if (counter2 > 0) {
        counter2--;
      }
    });
  }

  void decrimant2() {
    setState(() {
      if (counter3 > 0) {
        counter3--;
      }
    });
  }

  Widget _counters({required int counter, required int index}) {
    return Container(
      height: 35,
      width: 120,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: notifire!.getbordercolor,
          borderRadius: BorderRadius.circular(14)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
            onTap: () {
              switch (index) {
                case 1:
                  decrimant();
                case 2:
                  decrimant1();
                case 3:
                  decrimant2();
              }
            },
            child: Image.asset("assets/ic_minus_top.png")),
        Text("$counter",
            style: mediumBlackTextStyle.copyWith(
                fontSize: 18, color: notifire!.getMainText)),
        InkWell(
            onTap: () {
              switch (index) {
                case 1:
                  counterfun();
                case 2:
                  counterfun1();
                case 3:
                  counterfun2();
              }
            },
            child: Image.asset("assets/ic_plus_top.png")),
      ]),
    );
  }

  Widget _buildcart({required double size}) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: [
              // Divider(
              //   color: Colors.grey.shade200,
              //   height: 5,
              // ),
              const SizedBox(
                height: 20,
              ),
              size<900? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: _buidcompo1(maxWidth: constraints.maxWidth),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: _buildcompo2(),
                      ),
                    ],
                  )
                ],
              ) :  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: _buidcompo1(maxWidth: constraints.maxWidth),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildcompo2(),
                  )
                ],
              ),
            ],
          );
        });
  }
  
  Widget _buildcompo2(){
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: notifire!.getcontiner,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: Text(
                      "Order Summary",
                      style: mainTextStyle.copyWith(
                          color: notifire!.getMainText),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Text(
                            "Sub Total :",
                            style: mediumGreyTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "\$2955",
                                style: mediumBlackTextStyle.copyWith(
                                    color: notifire!.getTextColor1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Text(
                            "Discount :",
                            style: mediumGreyTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "\$29",
                                style: mediumBlackTextStyle.copyWith(
                                    color: notifire!.getTextColor1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Text(
                            "Shipping Charge :",
                            style: mediumGreyTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "\$55",
                                style: mediumBlackTextStyle.copyWith(
                                    color: notifire!.getTextColor1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Text(
                            "Estimated Tax :",
                            style: mediumGreyTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "\$00",
                                style: mediumBlackTextStyle.copyWith(
                                    color: notifire!.getTextColor1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Text(
                            "Total(Usd) :",
                            style: mediumGreyTextStyle.copyWith(
                                color: notifire!.getTextColor1,
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("\$1000",
                                  style: mediumGreyTextStyle.copyWith(
                                      color: notifire!.getTextColor1,
                                      fontSize: 16)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const SizedBox(height: 15,),
        Container(
          decoration: BoxDecoration(
            color: notifire!.getcontiner,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: Text(
                      "Have a Promo Code?",
                      style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.withOpacity(0.3))
                        ),
                        child: Center(
                          child: TextField(
                            style: mediumGreyTextStyle,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                                border: InputBorder.none,
                                hintText: "Coupon code",
                                hintStyle: mediumGreyTextStyle,
                                suffixIcon:  ElevatedButton(onPressed: () {}, child: const Text("Apply"))
                            ),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buidcompo1({required double maxWidth}){
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: notifire!.getcontiner,
        boxShadow: boxShadow,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Text(
                  "Shopping Cart",
                  style: mainTextStyle.copyWith(
                      color: notifire!.getMainText),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 680.0,
            width: maxWidth,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(
                  // height: 500,
                  width: 1600,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Table(
                                border: TableBorder.all(color: Colors.grey.withOpacity(0.3), width: 1, borderRadius:
                                    const BorderRadius
                                        .vertical(
                                        top: Radius.circular(
                                            12))),
                                columnWidths: const {
                                  0: FlexColumnWidth(1.5),
                                  1: FlexColumnWidth(2),
                                  2: FlexColumnWidth(1.3),
                                  3: FlexColumnWidth(2),
                                  4: FlexColumnWidth(2),
                                  5: FlexColumnWidth(3),
                                },
                                children: [
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                        vertical: 18,
                                      ),
                                      child: Center(
                                          child: Text("Prdouct",
                                              style: mediumBlackTextStyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight
                                                      .w700,
                                                  color: notifire!
                                                      .getMainText),
                                              overflow:
                                              TextOverflow
                                                  .ellipsis,
                                              maxLines: 2)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 18),
                                      child: Center(
                                          child: Text(
                                              "Prdouct Name",
                                              style: mediumBlackTextStyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight
                                                      .w700,
                                                  color: notifire!
                                                      .getMainText),
                                              overflow:
                                              TextOverflow
                                                  .ellipsis,
                                              maxLines: 2)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 18),
                                      child: Center(
                                          child: Text("Price",
                                              style: mediumBlackTextStyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight
                                                      .w700,
                                                  color: notifire!
                                                      .getMainText),
                                              overflow:
                                              TextOverflow
                                                  .ellipsis,
                                              maxLines: 2)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 18),
                                      child: Center(
                                          child: Text("Quantity",
                                              style: mediumBlackTextStyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight
                                                      .w700,
                                                  color: notifire!
                                                      .getMainText),
                                              overflow:
                                              TextOverflow
                                                  .ellipsis,
                                              maxLines: 2)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 18),
                                      child: Center(
                                          child: Text("Action",
                                              style: mediumBlackTextStyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight
                                                      .w700,
                                                  color: notifire!
                                                      .getMainText),
                                              overflow:
                                              TextOverflow
                                                  .ellipsis,
                                              maxLines: 2)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 18),
                                      child: Center(
                                          child: Text("Total",
                                              style: mediumBlackTextStyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight
                                                      .w700,
                                                  color: notifire!
                                                      .getMainText),
                                              overflow:
                                              TextOverflow
                                                  .ellipsis,
                                              maxLines: 2)),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 20),
                                      child: Center(
                                          child: Image.asset("assets/dance-shoes-png-transparent-dance-shoes-images-5-min.png",width: 80,height: 80,),
                                    )),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Text("Jorden Shoes",
                                              style: mediumBlackTextStyle
                                                  .copyWith(
                                                  color: notifire!
                                                      .getMainText))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Text("\$21",
                                              style: mediumBlackTextStyle
                                                  .copyWith(
                                                  color: notifire!
                                                      .getMainText))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .center,
                                            children: [
                                              _counters(
                                                  counter: counter1,
                                                  index: 1)
                                            ],
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset("assets/pen.png",color: notifire!.getMainText),
                                              const SizedBox(width: 5),
                                              Image.asset("assets/heart-circle.png",color: notifire!.getMainText),
                                              const SizedBox(width: 5),
                                              Image.asset("assets/trash.png",color: notifire!.getMainText)
                                            ],
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                        child: Text("\$12456",
                                            style: mediumBlackTextStyle
                                                .copyWith(
                                                color: notifire!.getMainText),
                                            overflow: TextOverflow
                                                .ellipsis),
                                      ),
                                    ),
                                    ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      child: Image.asset("assets/fashion-shoes-sneakers-removebg-preview-min.png",width: 80,height: 80,fit: BoxFit.contain),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Text(
                                              "Fancy Shoes",
                                              style: mediumBlackTextStyle
                                                  .copyWith(
                                                  color: notifire!
                                                      .getMainText))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Text("\$50",
                                              style: mediumBlackTextStyle
                                                  .copyWith(
                                                  color: notifire!
                                                      .getMainText))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .center,
                                            children: [
                                              _counters(
                                                  counter: counter2,
                                                  index: 2)
                                            ],
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset("assets/pen.png",color: notifire!.getMainText),
                                              const SizedBox(width: 5),
                                              Image.asset("assets/heart-circle.png",color: notifire!.getMainText),
                                              const SizedBox(width: 5),
                                              Image.asset("assets/trash.png",color: notifire!.getMainText)
                                            ],
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Text("\$15456",
                                              style: mediumBlackTextStyle
                                                  .copyWith(
                                                  color: notifire!
                                                      .getMainText),
                                              overflow:
                                              TextOverflow
                                                  .ellipsis)),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 20),
                                      child: Center(
                                          child: Image.asset("assets/dance-shoes-png-transparent-dance-shoes-images-5-min.png",width: 80,height: 80,),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Text("Man shoes",
                                              style: mediumBlackTextStyle
                                                  .copyWith(
                                                  color: notifire!
                                                      .getMainText))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Text("\$11",
                                              style: mediumBlackTextStyle
                                                  .copyWith(
                                                  color: notifire!
                                                      .getMainText))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .center,
                                            children: [
                                              _counters(
                                                  counter: counter3,
                                                  index: 3)
                                            ],
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset("assets/pen.png",color: notifire!.getMainText),
                                              const SizedBox(width: 5),
                                              Image.asset("assets/heart-circle.png",color: notifire!.getMainText),
                                              const SizedBox(width: 5),
                                              Image.asset("assets/trash.png",color: notifire!.getMainText)
                                            ],
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Text(
                                            "\$15456",
                                            style: mediumBlackTextStyle
                                                .copyWith(
                                                color: notifire!
                                                    .getMainText),
                                            overflow:
                                            TextOverflow.ellipsis,
                                          )),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      child: Image.asset("assets/fashion-shoes-sneakers-removebg-preview-min.png",width: 80,height: 80,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Text("Sport shoes",
                                              style: mediumBlackTextStyle
                                                  .copyWith(
                                                  color: notifire!
                                                      .getMainText))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Text("\$16",
                                              style: mediumBlackTextStyle
                                                  .copyWith(
                                                  color: notifire!
                                                      .getMainText))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .center,
                                            children: [
                                              _counters(
                                                  counter: counter3,
                                                  index: 3)
                                            ],
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset("assets/pen.png",color: notifire!.getMainText),
                                              const SizedBox(width: 5),
                                              Image.asset("assets/heart-circle.png",color: notifire!.getMainText),
                                              const SizedBox(width: 5),
                                              Image.asset("assets/trash.png",color: notifire!.getMainText)
                                            ],
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 35),
                                      child: Center(
                                          child: Text(
                                            "\$16453",
                                            style: mediumBlackTextStyle
                                                .copyWith(
                                                color: notifire!
                                                    .getMainText),
                                            overflow:
                                            TextOverflow.ellipsis,
                                          )),
                                    ),
                                  ]),
                                ],
                              ),
                              Table(
                                border: TableBorder.all(
                                  color: Colors.grey
                                      .withOpacity(0.3),
                                  width: 1,
                                ),
                                columnWidths: const {
                                  0: FlexColumnWidth(4.76),
                                  1: FlexColumnWidth(1.4),
                                  2: FlexColumnWidth(2.1),
                                },
                                children: [
                                  TableRow(children: [
                                    Container(),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 18),
                                      child: Center(
                                        child: Text(
                                            "Total Price :",
                                            style: mediumBlackTextStyle
                                                .copyWith(
                                                fontSize: 16,
                                                color: notifire!
                                                    .getMainText),
                                            overflow: TextOverflow
                                                .ellipsis,
                                            maxLines: 2),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                        vertical: 18,
                                      ),
                                      child: Center(
                                        child: Text("\$6935.00",
                                            style: mediumBlackTextStyle
                                                .copyWith(
                                                fontSize: 14,
                                                color: notifire!
                                                    .getMainText),
                                            overflow: TextOverflow
                                                .ellipsis,
                                            maxLines: 2),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                              Table(
                                border: TableBorder.all(
                                    color: Colors.grey
                                        .withOpacity(0.3),
                                    width: 1,
                                    borderRadius:
                                    const BorderRadius
                                        .vertical(
                                        bottom:
                                        Radius.circular(
                                            12))),
                                columnWidths: const {
                                  0: FlexColumnWidth(0.75),
                                  1: FlexColumnWidth(0.256),
                                },
                                children: [
                                  TableRow(children: [
                                    Padding(
                                        padding: const EdgeInsets
                                            .symmetric(
                                            vertical: 18,
                                            horizontal: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .end,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                    const Color(
                                                        0xfff73164),
                                                    fixedSize:
                                                    const Size(
                                                        190,
                                                        38)),
                                                child: Text(
                                                  "Continue shopping",
                                                  style: mediumBlackTextStyle.copyWith(
                                                      color: Colors
                                                          .white,
                                                      fontWeight:
                                                      FontWeight
                                                          .w200),
                                                )),
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets
                                            .symmetric(
                                            vertical: 18,
                                            horizontal: 15),
                                        child: Center(
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                  const Color(0xff54ba4a),
                                                  fixedSize:
                                                  const Size(
                                                      120,
                                                      38)),
                                              child: Text(
                                                "Check out",
                                                style: mediumBlackTextStyle.copyWith(
                                                    color: Colors
                                                        .white,
                                                    fontWeight:
                                                    FontWeight
                                                        .w200),
                                              )),
                                        )),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
