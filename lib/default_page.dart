
// ignore_for_file: deprecated_member_use

import 'package:buzz/Widgets/comunpopup.dart';
import 'package:buzz/Widgets/comuntitle.dart';
import 'package:buzz/provider/proviercolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'Widgets/sizebox.dart';
import 'appstaticdata/staticdata.dart';
import 'comunbottombar.dart';
import 'comuntile1.dart';
import 'comunwidget2.dart';
import 'comunwidget3.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {

  String dropdownvalue = 'Today';


  var items = [
    'Today',
    'Tomorrow',
    'Yesterday',
  ];

  @override
  Widget build(BuildContext context) {
    return  Consumer<ColorNotifire>(
      builder: (context, value, child) =>  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: notifire!.getbgcolor,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) {
              // Mobile layout
              return SizedBox(
                // height: 900,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Default',path: "Dashboards"),
                      _buildlottiui(),
                      _buildpurchasegrup(),
                      _buildSalesgrup(),
                      _buildOrders(),
                      _buildmobileui(),
                      _buildrecentorders(),
                      _buildActivity(),
                      _buildRecentSales(),
                      _buildtimelin(),
                      _buildpuchasenow(),
                      _buildusergrowth(),
                      _buildpaperNote(),
                      const SizeBoxx(),
                      const ComunBottomBar(),
                    ],
                  ),
                ),
              );
            } else if (constraints.maxWidth < 1200) {
              // Tablet layout
              return SizedBox(
                // height: 1000,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Default',path: "Dashboards"),
                      Row(
                        children: [
                          Expanded(child: _buildlottiui()),
                          Expanded(child: _buildpurchasegrup()),
                          constraints.maxWidth>800? Expanded(child: _buildSalesgrup()):const SizedBox()
                        ],
                      ),
                      constraints.maxWidth<800? _buildSalesgrup():const SizedBox(),
                      _buildOrders(),
                      _build2row(),
                      Row(
                        children: [
                          Expanded(
                            child: _buildrecentorders(),
                          ),
                          Expanded(
                            child: _buildActivity(),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: _buildRecentSales(),
                          ),
                          Expanded(
                            child: _buildtimelin(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: _buildpuchasenow(),
                          ),
                          Expanded(
                            flex: 1,
                            child: _buildusergrowth(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: _buildpaperNote()
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                height: 350,
                              )
                          ),
                        ],
                      ),
                      const SizeBoxx(),
                      const ComunBottomBar(),
                    ],
                  ),
                ),
              );
            } else {
              // Website layout
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const ComunTitle(title: 'Default',path: "Dashboards"),
                    //frist
                    Row(
                      children: [
                        Expanded(child: _buildlottiui()),
                        Expanded(child: _buildpurchasegrup()),
                        Expanded(child: _buildSalesgrup()),
                        Expanded(child: _buildOrders()),
                      ],
                    ),

                    //secoond
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child:_build2row(),
                        ),
                        Expanded(
                          flex: 2,
                          child: _buildrecentorders(),
                        )
                      ],
                    ),
                    //3
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: _buildActivity(),
                        ),
                        Expanded(
                          flex: 1,
                          child: _buildRecentSales(),
                        ),
                        Expanded(
                          flex: 1,
                          child: _buildtimelin(),
                        )
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: _buildpuchasenow(),
                        ),
                        Expanded(
                          flex: 2,
                          child: _buildusergrowth(),
                        ),
                        Expanded(
                          flex: 2,
                          child: _buildpaperNote(),
                        ),
                      ],
                    ),
                    const SizeBoxx(),
                    const ComunBottomBar(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildlottiui(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 230,
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color(0xff3da4f0),
                Color(0xff7366ff)
              ],
            ),
          boxShadow: boxShadow,
        ),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  height: 200,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text("Welcome to Buzz.",style: mainTextStyle.copyWith(color: Colors.white),),
                      const SizedBox(height: 10,),
                      Text("Here whats happing in your account today",style: mediumGreyTextStyle.copyWith(color: Colors.white70),textAlign: TextAlign.start,),
                      const SizedBox(height: 40,),
                      Flexible(
                        flex: 1,
                        child: OutlinedButton(onPressed: (){},
                            style: OutlinedButton.styleFrom(
                                elevation: 0,
                                side: const BorderSide(color: Colors.white)
                            ),
                            child:  Text("Whats New !",style:mainTextStyle.copyWith(color: Colors.white,fontSize: 12),)),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      height: 200,
                    ),
                    Positioned(
                      top: 0,
                      right: 5,
                      child: SizedBox(
                        height: 250,
                        width: 200,
                        child: Image.asset("assets/cartoon 1.png",height: 200,width: 220,),
                      ),
                    )
                  ],
                )  ),
          ],
        ),
      ),
    );
  }

  Widget _buildpurchasegrup(){
    return const Column(
      children: [
        ComunTile1(name: 'Purchase', price: '10,000', trailing: '+50%', color: Colors.red, icon: 'assets/shopping-cart.svg'),
        ComunTile1(name: 'Sales', price: '4,200',trailing: '+70%', color: Colors.deepPurple, icon: 'assets/box-search.svg'),
      ],
    );
  }

  Widget _buildSalesgrup(){
    return const Column(
      children: [
        ComunTile1(name: 'Sales return', price: '7,000', trailing: '-20%', color: Colors.yellow, icon: 'assets/badge-discount.svg'),
        ComunTile1(name: 'Purchase rate', price: '5,700',trailing: '+70%', color: Colors.green, icon: 'assets/clipboard-search.svg'),

      ],
    );
  }

  Widget _buildOrders(){
    return Column(
      children: [
        _buidComuntile2(name: 'Orders', price: '1,80k', trailing: SizedBox(
          height: 60,
          width: 150,
          child: SvgPicture.asset("assets/btc-graph.svg",fit: BoxFit.fill,color: const Color(0xff7366ff)),
        ), color: Colors.deepPurple),


        _buidComuntile2(name: 'Profit', price: '6,90k', trailing: SizedBox(
          height: 60,
          width: 150,
          child: SvgPicture.asset("assets/btc-graph.svg",fit: BoxFit.fill,color: const Color(0xff37cefa)),
        ), color: const Color(0xff37cdfa)),
      ],
    );
  }

  Widget _buidComuntile2({required String name,required String price,required Widget trailing,required Color color}){
    return  Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              tileColor: Colors.indigo,
              title: Text(price,style:  mainTextStyle.copyWith(color: notifire!.getMainText),),
              subtitle: Text(name,style: mediumGreyTextStyle,),
              trailing: trailing,
            ),
          ],
        ),
      ),
    );
  }

  Widget _build2row(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 350,
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Expanded(
                flex: 4,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Row(
                                children: [
                                  Text("Overall Balance",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText),),
                                  const Expanded(child: SizedBox(width: 150,)),
                                  const CircleAvatar(radius:3 ,backgroundColor: Color(0xffB8E716),),
                                  const SizedBox(width: 5,),
                                  Expanded(child: Text("Earning",style: mediumGreyTextStyle.copyWith(fontSize: 13))),
                                  const Flexible(child: SizedBox(width: 15,)),
                                  const CircleAvatar(radius:3 ,backgroundColor: Color(0xff34CAA5),),
                                  const SizedBox(width: 5,),
                                  Text("Expense",style: mediumGreyTextStyle.copyWith(fontSize: 13))
                                ],
                            ),
                             ),
                             const SizedBox(height: 20,),
                            SizedBox(
                              height: 240,
                              width: 700,
                              child: SvgPicture.asset("assets/grop  10000000835.svg",fit: BoxFit.fill),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 350,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildcomunlisttile(title: '\$22,678', subtitle: 'Income', icon: 'assets/arrow-down-to-line.svg', price: '+\$45', color: Colors.green),
                        const SizedBox(height: 20,),
                        _buildcomunlisttile(title: '\$12,057', subtitle: 'Expense', icon: 'assets/hand-holding-dollar.svg', price: '+\$56', color: Colors.red),
                        const SizedBox(height: 20,),
                        _buildcomunlisttile(title: '\$8,678', subtitle: 'Cashback', icon: 'assets/dollar-circle.svg', price: '-\$23', color: Colors.green),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }

  Widget _buildcomunlisttile({required String title,required String subtitle,required String icon,required String price,required Color color}){
    return  ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
          height: 25,
          width: 25,
          child: Center(child: SvgPicture.asset(icon,width: 18,height: 18,color: notifire!.geticoncolor,)),

        ),
      ),
      title:  Text(subtitle,style: TextStyle(color: notifire!.getMainText)),
      subtitle:  Text(title,style: mediumGreyTextStyle.copyWith(fontSize: 13),),
      trailing:  Column(
        children: [
          const ComunPopup(),
          Text(price,style: TextStyle(color: color)),
        ],
      ),
    );
}

Widget _buildmobileui(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 500,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                              children: [
                                Text("Overall Balance",style: mainTextStyle.copyWith(fontSize: 17, color: notifire!.getMainText),),
                                const Expanded(child: SizedBox(width: 150,)),
                                const CircleAvatar(radius:3 ,backgroundColor: Color(0xffB8E716),),
                                const SizedBox(width: 5,),
                                Expanded(child: Text("Earning",style: mediumGreyTextStyle.copyWith(fontSize: 12,overflow: TextOverflow.ellipsis),maxLines: 1,)),
                                const Flexible(child: SizedBox(width: 15,)),
                                const CircleAvatar(radius:3 ,backgroundColor: Color(0xff34CAA5),),
                                const SizedBox(width: 5,),
                                Expanded(child: Text("Expense",style: mediumGreyTextStyle.copyWith(fontSize: 12,overflow: TextOverflow.ellipsis),maxLines: 1,))
                              ],
                          ),
                           ),
                          SizedBox(
                            height: 180,
                            width: 700,
                            child: SvgPicture.asset("assets/grop  10000000835.svg",fit: BoxFit.cover),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 250,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildcomunlisttile(title: '\$22,678', subtitle: 'Income', icon: 'assets/arrow-down-to-line.svg', price: '+\$45', color: Colors.green),
                      const SizedBox(height: 15,),
                      _buildcomunlisttile(title: '\$12,057', subtitle: 'Expense', icon: 'assets/hand-holding-dollar.svg', price: '+\$56', color: Colors.red),
                      const SizedBox(height: 15,),
                      _buildcomunlisttile(title: '\$8,678', subtitle: 'Cashback', icon: 'assets/dollar-circle.svg', price: '-\$23', color: Colors.green),
                    ],
                  ),
                ),

              ),
            )
          ],
        ),
      ),
    );
}

Widget _buildrecentorders(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        height: 350,
        child:  Column(
          children: [
             Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
              child: Row(
                children: [
                  Text("Recent Orders",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText)),
                  const Expanded(child: SizedBox(width: 200,)),
                  const ComunPopup(),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
                    child: SvgPicture.asset("assets/Diagram.svg",height: 250,width: 250,),
                  ),
                ),
                 Expanded(
                  flex: 2,
                  child: SizedBox(
                    // height: 275,
                    child: Row(
                      children: [
                         const SizedBox(width: 20,),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                            const CircleAvatar(
                              radius: 5,
                              backgroundColor: Color(0xff674AFF),
                            ),
                                const SizedBox(width: 8,),
                                Flexible(child: Text("Cancelled",style: mainTextStyle.copyWith(fontSize: 16,overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 1)),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            RichText(
                                overflow: TextOverflow.ellipsis,
                                text:  TextSpan(text: "2,302",style: mediumGreyTextStyle.copyWith(fontSize: 13),
                                children: [
                              TextSpan(text: "(Last 6 Month)",style: mediumGreyTextStyle.copyWith(fontSize: 13)),
                            ])),

                              const SizedBox(height: 20,),
                               Row(
                                children: [

                                  const CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Color(0xff02C39A),
                                  ),
                                  const SizedBox(width: 8,),
                                  Flexible(child: Text("Delivered",style: mainTextStyle.copyWith(fontSize: 16,overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 1,)),
                                ],
                              ),
                              const SizedBox(height: 10,),

                              RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text:  TextSpan(text: "9,302",style: mediumGreyTextStyle.copyWith(fontSize: 13),children: [

                                TextSpan(text: "(Last 6 Month)",style: mediumGreyTextStyle.copyWith(fontSize: 13)),
                              ])),
                              const SizedBox(height: 20,),
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Color(0xffFFAA35),
                                  ),
                                  const SizedBox(width: 8,),
                                  Text("Process",style: mainTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText),overflow: TextOverflow.ellipsis),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text:  TextSpan(text: "3202",style: mediumGreyTextStyle.copyWith(fontSize: 13),children: [

                                TextSpan(text: "(Last 1 Month)",style: mediumGreyTextStyle.copyWith(fontSize: 13)),
                              ])),
                              const SizedBox(height: 20,),
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Color(0xff3D3E52),
                                  ),
                                  const SizedBox(width: 8,),
                                  Text("On Route",style: mainTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText),overflow: TextOverflow.ellipsis),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text:  TextSpan(text: "302",style: mediumGreyTextStyle.copyWith(fontSize: 13),children: [

                                TextSpan(text: "(Last 8 Month)",style: mediumGreyTextStyle.copyWith(fontSize: 13)),
                              ]))
                          ],),
                        ),
                      ],
                    ),

                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
}

Widget _buildActivity(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        // height: 350,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                child: Row(
                  children: [
                     Text("Activity",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText)),

                    const Expanded(child: SizedBox(width: 200,)),

                    Container(
                      height: 40,
                      width: 110,
                      padding: const EdgeInsets.all(10),
                      decoration:  BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        color: notifire!.getbordercolor,
                      ),
                      child: DropdownButton(
                        dropdownColor: notifire!.getcontiner,
                        value: dropdownvalue,
                        style: const TextStyle(color: appMainColor),
                        elevation: 0,
                        underline: const SizedBox(),
                        icon: const Icon(Icons.keyboard_arrow_down,color: appMainColor),

                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18,),
                  child: Column(
                    children: [
                      _buildactivtile(title: 'Updated Product', subtitle: 'Quisque a consequent ante sit amet ma', date: '8th March, 2022', date2: '1 day ago'),
                      const SizedBox(height: 10,),
                      _buildactivtile(title: 'Tello just like your product', subtitle: 'Quisque a consequat ante sit amet ma', date: '15th Oct, 2022', date2: 'Today'),
                      const SizedBox(height: 10,),
                      _buildactivtile(title: 'Tello just like your product', subtitle: 'Quisque a consequat ante sit amet ma', date: '20th Sep, 2022', date2: '12:00 PM'),
                    ],
                  ),
              ),

            ],
          ),
        ),
      ),
    );
}

Widget _buildactivtile({required String title,required String subtitle,required String date,required String date2}){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 30,width: 150,
              decoration: BoxDecoration(
                  color: notifire!.getbordercolor,
                  borderRadius: BorderRadius.circular(10)
              ),
              child:  Center(child: Text(date,style: const TextStyle(color: Color(0xff9b9cad),fontSize: 14),)),),

            const Expanded(child: SizedBox(width: 200,)),

             Text(date2,style: const TextStyle(color: Color(0xff9b9cad),fontSize: 14),),
          ],
        ),
        const SizedBox(height: 12,),
         Text(title,style: mainTextStyle.copyWith(fontSize: 15,color: notifire!.getMainText),),
        const SizedBox(height: 8,),
         Text(subtitle,style: mediumGreyTextStyle.copyWith(fontSize: 13),),

      ],
    );
}

Widget _buildRecentSales(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: Row(
                children: [
                   Text("Recent Sales",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText)),

                  const Expanded(child: SizedBox(width: 200,)),

                  Container(
                    height: 40,
                    width: 110,
                    padding: const EdgeInsets.all(10),
                    decoration:   BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      color: notifire!.getbordercolor,
                    ),
                    child: DropdownButton(
                      dropdownColor: notifire!.getcontiner,
                      value: dropdownvalue,
                      style: const TextStyle(color: appMainColor),
                      elevation: 0,
                      underline: const SizedBox(),
                      icon: const Icon(Icons.keyboard_arrow_down,color:appMainColor),

                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),

            SizedBox(
              height: 275,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return  ListTile(
                    leading: const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: CircleAvatar(radius: 18,backgroundColor: Colors.transparent,backgroundImage: AssetImage("assets/Item7.png")),
                    ),
                    title:  Text("Jane Cooper",style: TextStyle(color: notifire!.getMainText)),
                    subtitle: Text("10 minutes ago",style: mediumGreyTextStyle.copyWith(fontSize: 13)),
                    trailing: const Text("\$200.00",style: TextStyle(color: Color(0xff6dc465)),),

                  );
              },),

            ),

          ],
        ),
      ),
    );
}

Widget _buildtimelin(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: Row(
                children: [
                   Text("Timeline",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText)),

                  const Expanded(child: SizedBox(width: 200,)),

                  Container(
                    height: 40,
                    width: 110,
                    padding: const EdgeInsets.all(10),
                    decoration:   BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      color: notifire!.getbordercolor,
                    ),
                    child: DropdownButton(
                      dropdownColor: notifire!.getcontiner,
                      value: dropdownvalue,
                      style: const TextStyle(color: appMainColor),
                      elevation: 0,
                      underline: const SizedBox(),
                      icon: const Icon(Icons.keyboard_arrow_down,color: appMainColor),

                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              // height: 290,
              width: 480,
              child: SvgPicture.asset("assets/Bars.svg",alignment: Alignment.centerLeft,)
            ),
            
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("24 Jan",style: TextStyle(color: notifire!.getMainText)),
                Text("25 Jan",style: TextStyle(color: notifire!.getMainText)),
                Text("26 Jan",style: TextStyle(color: notifire!.getMainText)),
                Text("27 Jan",style: TextStyle(color: notifire!.getMainText)),
                Text("28 Jan",style: TextStyle(color: notifire!.getMainText)),
                Text("29 Jan",style: TextStyle(color: notifire!.getMainText)),
              ],
            )

          ],
        ),
      ),
    );

}

Widget _buildpuchasenow(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: SizedBox(
        height: 350,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  height: 200,
                  decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(text:  TextSpan(text: "Buy",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText),children: [

                        TextSpan(text: " Pro Account ", style: mainTextStyle.copyWith(fontSize: 17,color: const Color(0xff34CAA5))),
                        TextSpan(text: " to Explore Primium Features",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText))

                      ]),textAlign: TextAlign.center,),
                      const SizedBox(height: 14,),

                      ElevatedButton(onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff34CAA5),
                              fixedSize: const Size(150, 40)
                          ),
                          child:  Text("Purchase Now",style: mainTextStyle.copyWith(fontSize: 14,color: Colors.white),))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                height: 200,
                decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(text:  TextSpan(text: "Buy",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText),children: [

                      TextSpan(text: " Pro Account ", style: mainTextStyle.copyWith(fontSize: 17,color: appMainColor)),
                      TextSpan(text: " to Explore Primium Features",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText))

                    ]),textAlign: TextAlign.center,),
                    const SizedBox(height: 14,),

                    ElevatedButton(onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appMainColor,
                          fixedSize: const Size(150, 40)
                        ),
                        child:  Text("Purchase Now",style: mainTextStyle.copyWith(fontSize: 14,color: Colors.white),))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
}

Widget _buildusergrowth(){

    return const Padding(
      padding: EdgeInsets.all(padding),
      child: SizedBox(
        height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Comun12(),
              ),
            ),

            Expanded(
              flex: 6,
              child: ComunWidget3(),
            )
          ],
        ),
      ),
    );
}

Widget _buildpaperNote(){
    return Padding(
      padding:  const EdgeInsets.all(padding),
      child: Container(
        // height: 380,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child:  Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Row(
                children: [
                  Text("PaperNote",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText)),

                  const Expanded(child: SizedBox(width: 200,)),
                  Text("View project", style: mediumGreyTextStyle.copyWith(fontSize: 13)),
                ],
              ),
              const SizedBox(height: 15,),
              Container(
                height: 150,
                decoration: const BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(image: AssetImage('assets/82_abstract_geometric_background_vector 1.png'),fit: BoxFit.cover)
                ),
                // height: 140,
                //   width: 550,
                //   child: Image.asset("assets/82_abstract_geometric_background_vector 1.png",fit: BoxFit.fill,alignment: Alignment.centerLeft,)
              ),
              const SizedBox(height: 15,),

               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text("Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet saint. Veldt official consequent dues enum veldt mollit.",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),textAlign: TextAlign.start,),
              ),
              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: _buildpapernotecontiner(title: 'SAAS', bgcolor: const Color(0xfff2f3f6), textcolor: const Color(0xff7366ff))),

                    Flexible(child: _buildpapernotecontiner(title: 'Commerce', bgcolor: const Color(0xffe6f5e4), textcolor: const Color(0xff6dc465))),

                    Flexible(child: _buildpapernotecontiner(title: 'Crypto', bgcolor: const Color(0xfffff6e6), textcolor: const Color(0xfffeb629))),

                    Flexible(child: _buildpapernotecontiner(title: 'Project', bgcolor: const Color(0xffd3f4fe), textcolor: const Color(0xff62b4fc))),

                    Flexible(child: _buildpapernotecontiner(title: 'NFT', bgcolor: const Color(0xffffeff3), textcolor: const Color(0xfffc4438))),

                    Flexible(child: _buildpapernotecontiner(title: '+9', bgcolor: const Color(0xffe9e9ee), textcolor: const Color(0xff52526c))),

                    // Flexible(child: _buildpapernotecontiner(title: 'Inprogress', bgcolor: const Color(0xffe6f5e4), textcolor: const Color(0xff6dc465))),

                  ],
                ),
              ),
              const SizedBox(height: 10,),
              RichText(text: const TextSpan(text: "\$239,098",style: TextStyle(color: appMainColor,fontSize: 18,fontWeight: FontWeight.bold),children: [
                TextSpan(text: "(Budget)",style: TextStyle(color: Color(0xff52526c),fontSize: 15,fontWeight: FontWeight.w500))
              ]))
            ],
          ),
        ),
      ),
    );
}

Widget _buildpapernotecontiner({required String title,required Color bgcolor, required Color textcolor}){
    return   Container(
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      color: notifire!.getbordercolor,
      ),
      margin: const EdgeInsets.all(5),
      // padding: const EdgeInsets.all(5),
      child:  Center(child: Text(title,style: TextStyle(color: textcolor,fontSize: 12),)),
    );
}

}