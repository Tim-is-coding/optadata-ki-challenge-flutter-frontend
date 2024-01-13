
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Widgets/comuntitle.dart';
import 'Widgets/sizebox.dart';
import 'appstaticdata/staticdata.dart';
import 'charts/chart1.dart';
import 'charts/chart2.dart';
import 'charts/chart3.dart';
import 'charts/chart4.dart';
import 'charts/chart5.dart';
import 'charts/chart6.dart';
import 'comunbottombar.dart';
import 'provider/proviercolors.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {



  @override
  Widget build(BuildContext context) {

    return Consumer<ColorNotifire>(
      builder: (context, value, child) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: notifire!.getbgcolor,

          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 600) {
                // Mobile layout
                return   SizedBox(
                  height: 900,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        const ComunTitle(title: 'Chart',path: "Widgets"),
                        _buildTotalSale(),
                        _buildTotalProject(),
                        _buildTotalProduct(),
                        _buildMonthlyHistory(),
                        _buildOrderStatus(),
                        _buildSkillStatus(),
                        _buildCryptoPrice(),
                        _buildCryptoAnnotation(),

                        const SizeBoxx(),
                        const ComunBottomBar(),

                      ],
                    ),
                  ),
                );
              } else if (constraints.maxWidth < 1200) {
                if(constraints.maxWidth<900){
                  return SizedBox(
                    height: 1000,
                    width: double.infinity,

                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const ComunTitle(title: 'Chart',path: "Widgets"),
                          _buildTotalSale(),
                          _buildTotalProject(),
                          _buildTotalProduct(),
                          _buildMonthlyHistory(),
                          _buildOrderStatus(),
                          _buildSkillStatus(),
                          _buildCryptoPrice(),
                          _buildCryptoAnnotation(),

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
                          const ComunTitle(title: 'Chart',path: "Widgets"),
                          Row(
                            children: [
                              Expanded(child: _buildTotalSale()),
                              Expanded(child: _buildTotalProject()),
                              Expanded(child: _buildTotalSale()),
                            ],
                          ),

                          Row(
                            children: [
                              Expanded(child:_buildMonthlyHistory()),

                            ],
                          ),
                          Row(
                            children: [
                              Expanded(flex: 3,child:_buildSkillStatus()),
                              Expanded(flex: 4,child:_buildOrderStatus()),

                            ],
                          ),
                          Row(
                            children: [
                              Expanded(flex: 4,child:_buildCryptoPrice()),
                              Expanded(flex: 3,child:_buildCryptoAnnotation()),

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
                return   SizedBox(
                  height: 1000,
                  width: double.infinity,

                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const ComunTitle(title: 'Chart',path: "Widgets"),

                        Row(
                          children: [
                            Expanded(child: _buildTotalSale()),
                            Expanded(child: _buildTotalProject()),
                            Expanded(child: _buildTotalProduct()),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(child:_buildMonthlyHistory()),

                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 3,child:_buildSkillStatus()),
                            Expanded(flex: 4,child:_buildOrderStatus()),

                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 4,child:_buildCryptoPrice()),
                            Expanded(flex: 3,child:_buildCryptoAnnotation()),

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
      },
    );
  }
  Widget _buildTotalSale(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Total Sale",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText)),
            ),
            const Chart2(bgcolor: Color(0xffc7c2ff), bordercolor: Color(0xff7d70ff),),
          ],
        ),
      ),
    );

  }
  Widget _buildTotalProject(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Total Project",style:mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText)),
            ),
            const Chart2(bgcolor: Color(0xfffcaec2), bordercolor: Color(0xfff73265),),
          ],
        ),
      ),
    );

  }
  Widget _buildTotalProduct(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Total Product",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText)),
            ),
            const Chart2(bgcolor: Color(0xffb8e3a6), bordercolor: Color(0xff5bbf32),),
          ],
        ),
      ),
    );

  }

  Widget _buildMonthlyHistory(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 390,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Monthly History",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText)),
            ),
            const Chart3(),
          ],
        ),

      ),
    );

  }

  Widget _buildSkillStatus(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
         child:  Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Live Product",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText)),
             ),
             const Chart7(),
           ],
         ),
      ),
    );

  }
  Widget _buildOrderStatus(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Skill Status",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText)),
            ),
            const Chart4(),
          ],
        ),
      ),
    );

  }
  Widget _buildCryptoPrice(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child:   Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Cryptocurrency Prices",style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText)),
            ),
            const Chart5(),
          ],
        ),
      ),
    );

  }

  Widget _buildCryptoAnnotation(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child:  const Chart1(),
      ),
    );

  }
}

