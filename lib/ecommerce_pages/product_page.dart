// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables


import 'package:buzz/Widgets/comuntitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Widgets/sizebox.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';
import '../controllerss/productpagecontroller.dart';
import '../provider/proviercolors.dart';
import '../staticdata.dart';
import 'newhover.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

List<String> dropdownOptions1 = ['Featured', 'Lowest Price', 'Highest Price'];
String? selectedOption1 = "Featured";
int counter = 0;
List category =[
  "All",
  "Man",
  "Woman",
  "Kids",
  "Underwear",
  "Tops",
  "All",
  "Man",
  "Woman",
  "Kids",
  "Underwear",
  "Tops",
];

int selectCategory = 0;
int levelClock = 180;



class _ProductPageState extends State<ProductPage>{



String? day1;

  @override
  void initState() {
    super.initState();

    controller.startTimer();


  }
  final ProductPageController controller = Get.put(ProductPageController());
  late ColorNotifire  notifire;

  // ProductPageController productPageController = Get.put(ProductPageController());

  @override
  Widget build(BuildContext context) {


     notifire = Provider.of<ColorNotifire>(context,listen: true);


      return GetBuilder<ProductPageController>(
        builder: (controller) {
          return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: notifire.getbgcolor,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {

                    if (constraints.maxWidth < 600) {

                      controller.gridcounter.value = 1;
                      // Mobile layout
                      return SizedBox(
                        height: 900,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              const ComunTitle(
                                  title: 'Product', path: "E-Commerce"),
                              const SizedBox(
                                height: padding,
                              ),
                              // _buildLayoutSelectionmobile(),
                              //  _buildsearchbar(size: constraints.maxWidth),
                              Row(
                                children: [
                                  Expanded(child: _buildcategory(maxWidth: constraints.maxWidth,count:  1)),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(child: _buildcart()),
                                ],
                              ),
                              const SizeBoxx(),
                              const ComunBottomBar()
                            ],
                          ),
                        ),
                      );
                    } else if (constraints.maxWidth < 1200) {
                      if (constraints.minWidth < 800) {
                        controller.gridcounter.value = 2;
                        return SizedBox(
                          height: 1000,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const ComunTitle(
                                    title: 'Product', path: "E-Commerce"),
                                const SizedBox(
                                  height: padding,
                                ),
                                // _builddropdown(),
                                // _buildsearchbar(size: constraints.maxWidth),
                                Row(
                                  children: [
                                    Expanded(child: _buildcategory(maxWidth: constraints.maxWidth,count:  2)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(child: _buildcart()),
                                  ],
                                ),
                                const SizeBoxx(),
                                const ComunBottomBar()
                              ],
                            ),
                          ),
                        );
                      } else {
                        controller.gridcounter.value = 3;
                        return SizedBox(
                          height: 1000,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const ComunTitle(
                                    title: 'Product', path: "E-Commerce"),
                                const SizedBox(
                                  height: padding,
                                ),
                                Row(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: _buildcategory(maxWidth: constraints.maxWidth,count:  3)),
                                     Expanded(
                                        flex: 1,
                                        child: _buildcart()),
                                  ],
                                ),
                                const SizeBoxx(),
                                const ComunBottomBar()
                              ],
                            ),
                          ),
                        );
                      }
                      // Tablet layout
                    } else {
                      controller.gridcounter.value = 4;
                      // productPageController.selectGride.value = 4;
                      // Website layout
                      return SizedBox(
                        // height: 1000,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const ComunTitle(
                                  title: 'Product', path: "E-Commerce"),
                              const SizedBox(
                                height: padding,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                       flex: 3,
                                      child: _buildcategory(maxWidth: constraints.maxWidth,count:  4)),
                                   Expanded(
                                      flex: 1,
                                      child: _buildcart()),
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
              );
        }
      );
  }

  Widget _buildcart(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
      child: Container(
        // height: 800,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
              Radius.circular(12)),
          color: notifire.getcontiner,
          boxShadow: boxShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Shopping Cart",style: mainTextStyle.copyWith(color: notifire.getMainText),),
                const SizedBox(height: 15,),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Customer Name",
                    hintStyle: mediumGreyTextStyle,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
                    disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
                    enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    SvgPicture.asset("assets/shopping-cart.svg",width: 22,height: 22,color: appGreyColor,),
                    const SizedBox(width: 8,),
                    Text("Cart List",style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),),
                    const Spacer(),
                    Text("Clear",style: mediumBlackTextStyle.copyWith(color: appMainColor),),
                  ],
                ),

                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(height: 40,),
                        Row(
                          children: [
                            Expanded(child: Text("Roadster Men Navy Solid Round",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey.withOpacity(0.3))
                              ),
                              child: const Icon(Icons.delete,color: appGreyColor,size: 18),
                            )
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey.withOpacity(0.3))
                              ),
                              padding: const EdgeInsets.all(8),
                              child:  Text("M",style: mediumGreyTextStyle),
                            ),

                            const SizedBox(width:  8,),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey.withOpacity(0.3))
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    color: Colors.brown,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.withOpacity(0.3)),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: (){
                                          setState(() {
                                            counter++;
                                          });
                                        },
                                        child: Text("+",style: mediumGreyTextStyle.copyWith( fontSize: 16),)),
                                    const SizedBox(width: 8,),
                                    Text(counter.toString(),style: mediumBlackTextStyle.copyWith(fontSize: 18,color: notifire.getTextColor1),),
                                    const SizedBox(width: 8,),
                                    InkWell(
                                        onTap: () {
                                          if(counter>0){
                                            setState(() {
                                              counter--;
                                            });
                                          }
                                        },
                                        child: Text("-",style: mediumGreyTextStyle.copyWith(fontSize: 16),)),
                                  ]),
                            ),
                            const Spacer(),
                            Text("\$${index+1}9${index+2}",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1,fontSize: 18),)
                          ],
                        )
                      ],
                    );
                  },),

                const SizedBox(height: 25,),
                Divider(height: 40,color: Colors.grey.withOpacity(0.3),),
                Row(
                  children: [
                    Text("Subtotal",style: mediumGreyTextStyle,),
                    const Spacer(),
                    Text("\$400",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                  ],
                ),
                const SizedBox(height: 12,),
                Row(
                  children: [
                    Text("Text",style: mediumGreyTextStyle,),
                    const Spacer(),
                    Text("\$400",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                  ],
                ),
                const SizedBox(height: 12,),
                Row(
                  children: [
                    Text("Discount",style: mediumGreyTextStyle,),
                    const Spacer(),
                    Text("\$400",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                  ],
                ),
                Divider(height: 40,color: Colors.grey.withOpacity(0.3),),
                Row(
                  children: [
                    Text("Total",style: mediumGreyTextStyle.copyWith(fontSize: 16),),
                    const Spacer(),
                    Text("\$400",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1,fontSize: 16),),
                  ],
                ),
                const SizedBox(height: 12,),
              ]),
        ),),
    );
}

  Widget _buildcategory ({required double maxWidth,required int count}){
    return SizedBox(
      width: 200,
      child:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(12)),
                      color: notifire.getcontiner,
                      boxShadow: boxShadow,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Category",style: mainTextStyle.copyWith(color: notifire.getMainText),),
                          const SizedBox(height: 10,),
                         SizedBox(
                            height: 80,
                            width: Get.width*0.9,
                            child: GetBuilder<AppConst>(
                              builder: (context) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: category.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          selectCategory = index;
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 150,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                                              border: Border.all(color: selectCategory==index? appMainColor : Colors.grey.withOpacity(0.3))),
                                          child:  Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(category[index],style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),),
                                              const SizedBox(height: 8,),
                                              Text("4${index}1${index+2} Product",style: mediumGreyTextStyle),

                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },);
                              }
                            ),
                         ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          // _builddropdown(),
          // _buildsearchbar(size: constraints.maxWidth),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
            child: Row(
              children: [
                Text("Product List",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),),
                const Spacer(),
                PopupMenuButton(
                  offset: const Offset(0, 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  tooltip: "",
                  color: notifire.getcontiner,
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/filter.svg",height: 22,width: 22,color: appGreyColor),
                      const SizedBox(width: 8,),
                      Text("Filters",style: mediumBlackTextStyle.copyWith(color: notifire.getTextColor1),)
                    ],
                  ),
                  itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                        padding:  EdgeInsets.symmetric(horizontal: maxWidth<600? 0:5),
                        child:   Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                               InkWell(
                                onTap: () {
                                  controller.gridcounter.value = 1;
                                  Get.back();
                                },
                                child: SvgPicture.asset("assets/grid-web-5.svg",height: 25,width: 25,color: controller.gridcounter.value == 1 ?  appMainColor : appGreyColor)
                               ),
                               const SizedBox(width: 8,),
                               InkWell(
                                onTap: () {
                                  controller.gridcounter.value = 2;
                                  Get.back();
                                },
                                child: SvgPicture.asset("assets/grid-web-6.svg",height: 25,width: 25,color: controller.gridcounter.value == 2 ?  appMainColor : appGreyColor)),
                               maxWidth<600? const SizedBox():Row(
                               children: [
                               const SizedBox(width: 8,),
                               InkWell(
                                   onTap: () {
                                     controller.gridcounter.value = 3;
                                     Get.back();
                                   },
                                   child: SvgPicture.asset("assets/grid-web-3.svg",height: 25,width: 25,color: controller.gridcounter.value == 3 ?  appMainColor : appGreyColor)),
                               const SizedBox(width: 8,),
                                 maxWidth<1000? const SizedBox() : InkWell(
                                   onTap: (){
                                     controller.gridcounter.value = 4;
                                     Get.back();
                                   },
                                   child: SvgPicture.asset("assets/grid-square.svg",height: 25,width: 25,color:controller.gridcounter.value == 4 ?  appMainColor : appGreyColor)),
                                 maxWidth<1000? const SizedBox() : const SizedBox(width: 8,),
                               ],
                             )
                           ],
                         ),
                       )
                    ];
                  },
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  // height: MediaQuery.of(context).size.height,
                  child: _buildgridview(width: maxWidth,count: count),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }



  Widget _buildgridview({required double width,required int count}) {
      return  GetBuilder<ProductPageController>(
        builder: (controller) {
          return  Obx((){
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: controller.gridcounter.value,
                  mainAxisExtent: 450),
              itemCount: controller.prodectname.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(padding),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      color: notifire.getcontiner,
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
                                    height: 500,
                                    width: 400,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.vertical(
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
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white.withOpacity(0.8)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/fire.svg",
                                            color: Colors.deepPurpleAccent,
                                            width: 20,
                                            height: 20,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "New",
                                            style: mediumBlackTextStyle,
                                          ),
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
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white.withOpacity(0.8)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/bolt.svg",
                                            color: Colors.deepOrange,
                                            height: 20,
                                            width: 20,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Obx(
                                            () => Text(
                                              '${controller.hours.value}:${controller.minutes.value}:${controller.seconds.value}',
                                              style: mediumBlackTextStyle,
                                            ),
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

                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(controller.prodectname[index],
                                      style: mediumGreyTextStyle.copyWith(
                                          fontSize: 13),
                                      overflow: TextOverflow.ellipsis),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(controller.prodectdiscription[index],
                                      style: mainTextStyle.copyWith(
                                          fontSize: 17,
                                          color: notifire.getMainText),
                                      overflow: TextOverflow.ellipsis),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(controller.prodectprice[index],
                                          style: mainTextStyle
                                              .copyWith(fontSize: 17)
                                              .copyWith(
                                                  color: appGreyColor,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                          overflow: TextOverflow.ellipsis),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        controller.prodectprice[index],
                                        style: mainTextStyle
                                            .copyWith(fontSize: 17)
                                            .copyWith(color: appMainColor),
                                        overflow: TextOverflow.ellipsis,
                                      ),
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
          });
        }
      );

  }




}

