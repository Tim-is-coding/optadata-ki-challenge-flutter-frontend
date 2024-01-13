
// ignore_for_file: deprecated_member_use

import 'package:buzz/Widgets/textfilde.dart';
import 'package:buzz/provider/proviercolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/sizebox.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';


class NewDefaultPage extends StatefulWidget {
  const NewDefaultPage({super.key});

  @override
  State<NewDefaultPage> createState() => _NewDefaultPage();
}

class _NewDefaultPage extends State<NewDefaultPage> {

  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardHolder = TextEditingController();
  TextEditingController cardCvc = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    cardNumber.dispose();
    cardHolder.dispose();
    cardCvc.dispose();
  }


  List countries = [
    "assets/india.png",
    "assets/argentina.png",
    "assets/brazil-.png",
    "assets/germany.png",
    "assets/united-kingdom.png",
    "assets/circle.png",
  ];

  List logo = [
    "assets/icons8-figma.svg",
    "assets/icons8-adobe-creative-cloud.svg",
    "assets/icons8-starbucks.svg",
    "assets/icons8-apple-logo.svg",
    "assets/icons8-facebook29.svg",
  ];
  List name = [
    "Figma",
    "Adobe-creative",
    "Starbucks",
    "Apple",
    "Facebook",
  ];
  List price = [
    "\$1001",
    "\$143",
    "\$213",
    "\$343",
    "\$123",
  ];
  List date = [
    "29/1/2023",
    "19/6/2023",
    "1/2/2023",
    "9/4/2023",
    "12/6/2023",
  ];
  List countriesname = [
    "India",
    "Argentina",
    "Brazil",
    "Germany",
    "United-kingdom",
    "United States",
  ];
  List subtitle = [
    "Subscription",
    "Subscription",
    "Receive",
    "Transfer",
    "Receive",
  ];
  List countriespr = [
    "50%",
    "20%",
    "10%",
    "9%",
    "3%",
    "2%",
  ];

  List card2name = [
    "Total Earnings",
    "Total Sale",
    "Total Profit",
    "Total Order",
  ];
  List card2price = [
    "\$1,222",
    "\$4,451",
    "\$7,136",
    "\$9,233",
  ];
  List<ChartData> chartData = [
    ChartData(1, 35,0),
    ChartData(2, 23,0),
    ChartData(3, 34,0),
    ChartData(4, 25,0),
    ChartData(5, 40,0),
    ChartData(6, 20,0),
    ChartData(7, 70,0),
    ChartData(8, 10,0),
  ];
  List card2pr = [
    "12%",
    "20.2%",
    "15.6%",
    "39.3%",
  ];
  List card2value = [
    0.3,
    0.6,
    0.9,
    0.2,
  ];
  List card2price1 = [
    "\$9,233",
    "\$7,136",
    "\$1,222",
    "\$4,451",
  ];
  List cardcolors =[
    const Color(0xff1a7cbc),
    const Color(0xfff07521),
    const Color(0xff4caf50),
    const Color(0xff18a0fb),
  ];
  ColorNotifire notifire = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context,listen: true);
    return DefaultTabController(
     length: 3,
      initialIndex: 0,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: notifire.getbgcolor,
        child: LayoutBuilder(builder: (context, constraints) {
          if(constraints.maxWidth<600){
            return  SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const ComunTitle(title: 'Default',path: "Dashboards"),
                  _buildcompo1(title: "Total Earnings", iconpath: "assets/dollar-circle33.svg", price: "\$ 29,955", pr: "9.55%", maincolor: Colors.blueAccent, secondicon: "assets/arrow-up-small.svg"),
                  _buildcompo1(title: "Customer", iconpath: "assets/users33.svg", price: "\$ 19,235", pr: "2.29%", maincolor: Colors.pinkAccent, secondicon: "assets/arrow-up-small.svg"),
                  _buildcompo1(title: "Orders", iconpath: "assets/box-check33.svg", price: "\$ 9,955", pr: "3.23%", maincolor: Colors.deepOrangeAccent, secondicon: "assets/arrow-down-small.svg"),
                  _buildcompo1(title: "Available Balance", iconpath: "assets/wallet33.svg", price: "\$ 95,295", pr: "5.33%", maincolor: Colors.deepPurpleAccent, secondicon: "assets/arrow-up-small.svg"),
                  _buildcompo1(title: "New Sales", iconpath: "assets/coins29.svg", price: "\$ 1,365", pr: "3.53%", maincolor: const Color(0xff0CAF60), secondicon: "assets/arrow-down-small.svg"),
                  _buildcompo1(title: "Income per lead", iconpath: "assets/user29.svg", price: "\$ 235", pr: "1.77%", maincolor: const Color(0xff0059E7), secondicon: "assets/arrow-up-small.svg"),
                  _buildcompo1(title: "New leads", iconpath: "assets/receipt-list29.svg", price: "\$ 955", pr: "7.43%", maincolor: const Color(0xffF7931A), secondicon: "assets/arrow-down-small.svg"),
                  _buildcompo1(title: "Conversion rate", iconpath: "assets/ranking29.svg", price: "\$ 5,295", pr: "10.23%", maincolor: const Color(0xff267DFF), secondicon: "assets/arrow-up-small.svg"),

                  _buildcompo2(),
                  _buildcompo3(width: constraints.maxWidth),
                  _buildcompo4(),
                  _buildcompo5(count: 1),
                  _buildcompo6formobile(),
                  const SizeBoxx(),
                  const ComunBottomBar(),
                ],),
            );
          }else if(constraints.maxWidth<1000){
            return  SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const ComunTitle(title: 'Default',path: "Dashboards"),
                  Row(
                    children: [
                      Expanded(
                        child: _buildcompo1(title: "Total Earnings", iconpath: "assets/dollar-circle33.svg", price: "\$ 29,955", pr: "9.55%", maincolor: Colors.blueAccent, secondicon: "assets/arrow-up-small.svg"),
                      ),
                      Expanded(
                        child: _buildcompo1(title: "Customer", iconpath: "assets/users33.svg", price: "\$ 19,235", pr: "2.29%", maincolor: Colors.pinkAccent, secondicon: "assets/arrow-up-small.svg"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildcompo1(title: "Orders", iconpath: "assets/box-check33.svg", price: "\$ 9,955", pr: "3.23%", maincolor: Colors.deepOrangeAccent, secondicon: "assets/arrow-down-small.svg"),
                      ),
                      Expanded(
                        child: _buildcompo1(title: "Available Balance", iconpath: "assets/wallet33.svg", price: "\$ 95,295", pr: "5.33%", maincolor: Colors.deepPurpleAccent, secondicon: "assets/arrow-up-small.svg"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child:_buildcompo1(title: "New Sales", iconpath: "assets/coins29.svg", price: "\$ 1,365", pr: "3.53%", maincolor: const Color(0xff0CAF60), secondicon: "assets/arrow-down-small.svg"),
                      ),
                      Expanded(
                        child:_buildcompo1(title: "Income per lead", iconpath: "assets/user29.svg", price: "\$ 235", pr: "1.77%", maincolor: const Color(0xff0059E7), secondicon: "assets/arrow-up-small.svg"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child:  _buildcompo1(title: "New leads", iconpath: "assets/receipt-list29.svg", price: "\$ 955", pr: "7.43%", maincolor: const Color(0xffF7931A), secondicon: "assets/arrow-down-small.svg"),
                      ),
                      Expanded(
                        child: _buildcompo1(title: "Conversion rate", iconpath: "assets/ranking29.svg", price: "\$ 5,295", pr: "10.23%", maincolor: const Color(0xff267DFF), secondicon: "assets/arrow-up-small.svg"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: _buildcompo2()),
                      Expanded(
                          child: _buildcompo4()),
                    ],
                  ),
                  _buildcompo3(width: constraints.maxWidth),
                  Row(
                    children: [
                      Expanded(child: _buildcompo5(count: 2)),
                    ],
                  ),
                  _buildcompo6formobile(),
                  const SizeBoxx(),
                  const ComunBottomBar(),
              ],),
            );
          }else{
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const ComunTitle(title: 'Default',path: "Dashboards"),
                  Row(
                    children: [
                      Expanded(
                        child: _buildcompo1(title: "Total Earnings", iconpath: "assets/dollar-circle33.svg", price: "\$ 29,955", pr: "9.55%", maincolor: Colors.blueAccent, secondicon: "assets/arrow-up-small.svg"),
                      ),
                      Expanded(
                        child: _buildcompo1(title: "Customer", iconpath: "assets/users33.svg", price: "\$ 19,235", pr: "2.29%", maincolor: Colors.pinkAccent, secondicon: "assets/arrow-up-small.svg"),
                      ),
                      Expanded(
                        child: _buildcompo1(title: "Orders", iconpath: "assets/box-check33.svg", price: "\$ 9,955", pr: "3.23%", maincolor: Colors.deepOrangeAccent, secondicon: "assets/arrow-down-small.svg"),
                      ),
                      Expanded(
                        child: _buildcompo1(title: "Available Balance", iconpath: "assets/wallet33.svg", price: "\$ 95,295", pr: "5.33%", maincolor: Colors.deepPurpleAccent, secondicon: "assets/arrow-up-small.svg"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildcompo1(title: "New Sales", iconpath: "assets/coins29.svg", price: "\$ 1,365", pr: "3.53%", maincolor: const Color(0xff0CAF60), secondicon: "assets/arrow-down-small.svg"),
                      ),
                      Expanded(
                        child: _buildcompo1(title: "Income per lead", iconpath: "assets/user29.svg", price: "\$ 235", pr: "1.77%", maincolor: const Color(0xff0059E7), secondicon: "assets/arrow-up-small.svg"),
                      ),
                      Expanded(
                        child: _buildcompo1(title: "New leads", iconpath: "assets/receipt-list29.svg", price: "\$ 955", pr: "7.43%", maincolor: const Color(0xffF7931A), secondicon: "assets/arrow-down-small.svg"),
                      ),
                      Expanded(
                        child: _buildcompo1(title: "Conversion rate", iconpath: "assets/ranking29.svg", price: "\$ 5,295", pr: "10.23%", maincolor: const Color(0xff267DFF), secondicon: "assets/arrow-up-small.svg"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildcompo2(),
                      ),
                      Expanded(
                        flex: 3,
                        child: _buildcompo3(width: constraints.maxWidth),
                      ),
                      Expanded(
                        flex: 2,
                        child:_buildcompo4(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildcompo5(count: 4)),
                    ],
                  ),
                  _buildcompo6(),
                  const SizeBoxx(),
                  const ComunBottomBar(),

                ],
              ),
            );
          }
        },),
      ),
    );
  }

  Widget _buildcompo1({required String title,required String iconpath,required String price,required String pr,required Color maincolor,required String secondicon}){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 100,
        // width: 200,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire.getcontiner,
          boxShadow: boxShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              dense: true,
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: maincolor.withOpacity(0.2),
                ),
                child: Center(child: SvgPicture.asset(iconpath,height: 25,width: 25,)),
              ),
              title: Text(title,style: mediumGreyTextStyle,),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(price,style: mainTextStyle.copyWith(color: notifire.getMainText),),
                    const SizedBox(width: 10,),
                    Flexible(child: Text(pr,style: mediumGreyTextStyle,overflow: TextOverflow.ellipsis)),
                    const SizedBox(width: 5,),
                    SvgPicture.asset(secondicon,height: 16,width: 16,color: notifire.getMainText),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildcompo2(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        // height: 500,
        padding: const EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire.getcontiner,
          boxShadow: boxShadow,
        ),
        child: Column(
          children: [
            Row(
              children: [
              Text("Top Countries",style: mainTextStyle.copyWith(color: notifire.getMainText,fontSize: 18),),
              const Spacer(),
              SvgPicture.asset("assets/more-vertical.svg",height: 20,width: 20,color: notifire.getMainText),
            ],),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: countries.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(height: 20,),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    dense: true ,
                    leading:  CircleAvatar(backgroundImage: AssetImage(countries[index]),backgroundColor: Colors.transparent),
                    trailing: Text(countriespr[index],style: mediumGreyTextStyle.copyWith(fontSize: 14),overflow: TextOverflow.ellipsis),
                    title: Text(countriesname[index],style: mediumBlackTextStyle.copyWith(color: notifire.getMainText,fontSize: 16,overflow: TextOverflow.ellipsis),),
                  ),
                ],
              );
            },),
            const SizedBox(height: 14,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("See all",style: mediumGreyTextStyle,),
                const SizedBox(width: 8,),
              SvgPicture.asset("assets/angle-right-small.svg",color: notifire.getMainText,),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildcompo3({required double width}){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        // height: 400,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Colors.blueAccent.withOpacity(0.2),
          boxShadow: boxShadow,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50,),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffffc107),
                        ),
                        child: Center(child: Text("On The Go",style: mediumBlackTextStyle)),
                      ),
                       const SizedBox(height: 20,),
                       Text("Download Your Buzz. App fast",style: mainTextStyle.copyWith(color: notifire.getTextColor1,fontSize: 30,fontWeight: FontWeight.w800),overflow: TextOverflow.ellipsis,maxLines: 3,),
                      const SizedBox(height: 45,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff1e1e1e),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            fixedSize: const Size(100, 42)
                          ),
                          onPressed: () async {
                            const url = 'https://drive.google.com/file/d/1RVrFsDuxwzBAVjvWHfAkzpxr0DKKCd7O/view?usp=drive_link'; // Replace with your Google Drive link

                            if (await canLaunch(url)) {
                            await launch(url);
                            }
                          }, child: Text("Download",style: mediumBlackTextStyle.copyWith(color: Colors.white),)),
                      const SizedBox(height: 15,),
                      Text('Available for Android and ios',style: mediumGreyTextStyle,overflow: TextOverflow.ellipsis,maxLines: 2),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset("assets/rocket.png",height: width<600? 280  :   350,width:  width<600? 280  :   350,fit: BoxFit.cover),
            )
          ],
        ),
      ),
    );
  }
  Widget _buildcompo4(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        // height: 450,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire.getcontiner,
          boxShadow: boxShadow,
        ),
        child:
        Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            children: [
              Row(children: [
                 Text("Recent Activity",style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),),
                const SizedBox(width: 8,),
                SvgPicture.asset("assets/info-circle.svg",height: 22,width: 22,color: notifire.getMainText,),
                const Spacer(),
                Text("See more",style: mediumGreyTextStyle,),
                SvgPicture.asset("assets/angle-right-small.svg",height: 22,width: 22,color: notifire.getMainText,)
               ],),
               const SizedBox(height: 16,),
               ListView.builder(
                 physics: const NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 itemCount: name.length,
                 itemBuilder: (context, index) {
                 return Column(
                   children: [
                     const SizedBox(height: 10,),
                     ListTile(
                       leading: CircleAvatar(backgroundColor: Colors.transparent,child: SvgPicture.asset(logo[index]),),
                       title: Text(name[index],style: mediumBlackTextStyle.copyWith(color: notifire.getMainText)),
                       trailing: Column(
                           children: [
                             const SizedBox(height: 10,),
                         Text(price[index],style: mediumBlackTextStyle.copyWith(color: notifire.getMainText)),
                         const SizedBox(height: 5,),
                         Text(date[index],style: mediumGreyTextStyle),
                       ]),
                       subtitle: Padding(
                         padding: const EdgeInsets.only(top: 4),
                         child: Text(subtitle[index],style: mediumGreyTextStyle),
                       ),
                     ),
                   ],
                 );
               },),
              const SizedBox(height: 16,),

            ],
          ),
        ),
      ),
    );
  }
  Widget _buildcompo5({required int count}){
   return GridView.builder(
     itemCount: card2name.length,
     shrinkWrap: true,
     physics: const NeverScrollableScrollPhysics(),
     gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: count,mainAxisExtent: 200), itemBuilder: (context, index) {
     return Padding(
       padding: const EdgeInsets.all(padding),
       child: Container(
         height:200,
         padding: const EdgeInsets.all(padding),
         decoration: BoxDecoration(
           borderRadius: const BorderRadius.all(Radius.circular(12)),
           color: notifire.getcontiner,
           boxShadow: boxShadow,
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
           Row(
             children: [
                Text(card2name[index],style: mediumBlackTextStyle.copyWith(color: notifire.getMainText)),
               const Spacer(),
               SvgPicture.asset("assets/more-vertical.svg",height: 20,width: 20,color: notifire.getMainText,)
             ],
           ),
           const SizedBox(height: 20,),
           Row(
             children: [
               Text(card2price[index],style: mainTextStyle.copyWith(color: notifire.getTextColor1),),
               const SizedBox(width: 15,),
               Text(card2pr[index],style: mediumBlackTextStyle.copyWith(color: cardcolors[index]),)
             ],
           ),
           const SizedBox(height: 12,),
           ClipRRect(
             borderRadius: BorderRadius.circular(8),
             child:   SizedBox(
               height: 8,
               child: LinearProgressIndicator(
                 value: card2value[index], // percent filled
                 valueColor:  AlwaysStoppedAnimation(cardcolors[index]),
                 backgroundColor: cardcolors[index].withOpacity(0.1),
               ),
             ),
           ),
           const SizedBox(height: 8,),
           RichText(text: TextSpan(children: [
              TextSpan(text: "This week Extra Earnnig ",style: mediumGreyTextStyle),
             TextSpan(text: card2price1[index],style: mediumBlackTextStyle.copyWith(color: cardcolors[index])),
           ]))
         ]),
       ),
     );

   },);
  }

  Widget _buildcharts(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        padding: const EdgeInsets.all(padding),
        height: 480,
        child: Column(
          children: [
            Row(
              children: [
                Text("Selling Growth",style: mainTextStyle.copyWith(fontSize: 17,color: notifire.getMainText)),
                const Spacer(),
                SvgPicture.asset("assets/more-vertical.svg",height: 20,width: 20,color: notifire.getMainText,)
              ],
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: SfCartesianChart(
                  series: <ChartSeries<ChartData, int>>[
                    ColumnSeries<ChartData, int>(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        color: appMainColor,
                        borderRadius: const BorderRadius.all(Radius.circular(15))
                    )
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _buildpayment(){
    return  Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 480,
        padding: const EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Payment Method",style: mainTextStyle.copyWith(fontSize: 17,color: notifire.getMainText),),
            const SizedBox(height: 12,),
            SizedBox(
              height: 40,
              width: 380,
              child: TabBar(
                  labelStyle: mediumBlackTextStyle.copyWith(color: notifire.getMainText),
                  unselectedLabelColor: notifire.getMainText,
                  labelColor: Colors.white,
                  indicator:  BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(12)),
                  tabs: const [
                    Text("Credit",),
                    Text("Debit Card",),
                    Text("Master Crad",),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(child: ComunTextField(title: "Card Number", hinttext: "Enter Number", controller: cardNumber)),
                              const SizedBox(width: 10,),
                              Expanded(child: ComunTextField(title: "Card Holder", hinttext: "Enter Name", controller: cardHolder)),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Expiration Date",style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),),
                                    const SizedBox(height: 10,),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey.withOpacity(0.3)),
                                          borderRadius: const BorderRadius.all(Radius.circular(8))
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        style: TextStyle(color: notifire.getMainText),
                                        dropdownColor: notifire.getcontiner,
                                        padding: const EdgeInsets.only(left: 10),
                                        value: selectedOption,
                                        items: dropdownOptions1.map((String option) {
                                          return DropdownMenuItem<String>(
                                            value: option,
                                            child: Text(option),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedOption = newValue;
                                          });
                                        },
                                        decoration:  InputDecoration(
                                          hintStyle: mediumGreyTextStyle.copyWith(fontSize: 13),

                                          hintText: 'Select an option',
                                          border:InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 25,),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey.withOpacity(0.3)),
                                          borderRadius: const BorderRadius.all(Radius.circular(8))
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        style: TextStyle(color: notifire.getMainText),
                                        dropdownColor: notifire.getcontiner,
                                        padding: const EdgeInsets.only(left: 10),
                                        value: selectedOption1,
                                        items: dropdownOptions2.map((String option) {
                                          return DropdownMenuItem<String>(
                                            value: option,
                                            child: Text(option),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedOption1 = newValue;
                                          });
                                        },
                                        decoration:  InputDecoration(
                                          hintStyle: mediumGreyTextStyle.copyWith(fontSize: 13),

                                          hintText: 'Select an option',
                                          border:InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(flex: 1, child: ComunTextField(title: "Card Number", hinttext: "Number", controller: cardCvc)),
                              const SizedBox(width: 10,),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 25,),
                                      Text("Three or Four Digits,usually found on the back of the card",style: mediumGreyTextStyle,overflow: TextOverflow.ellipsis,maxLines: 2),
                                    ],
                                  ))
                            ],
                          ),
                          const SizedBox(height: 20,),
                          ElevatedButton(

                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  fixedSize: const Size.fromHeight(40)
                              ),
                              onPressed: () {}, child: Text("Proceed",style: mediumBlackTextStyle.copyWith(color: Colors.white),)),

                        ]
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(child: ComunTextField(title: "Card Number", hinttext: "Enter Number", controller: cardNumber)),
                              const SizedBox(width: 10,),
                              Expanded(child: ComunTextField(title: "Card Holder", hinttext: "Enter Name", controller: cardHolder)),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Expiration Date",style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),),
                                    const SizedBox(height: 10,),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey.withOpacity(0.3)),
                                          borderRadius: const BorderRadius.all(Radius.circular(8))
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        style: TextStyle(color: notifire.getMainText),
                                        dropdownColor: notifire.getcontiner,
                                        padding: const EdgeInsets.only(left: 10),
                                        value: selectedOption,
                                        items: dropdownOptions1.map((String option) {
                                          return DropdownMenuItem<String>(
                                            value: option,
                                            child: Text(option),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedOption = newValue;
                                          });
                                        },
                                        decoration:  InputDecoration(
                                          hintStyle: mediumGreyTextStyle.copyWith(fontSize: 13),

                                          hintText: 'Select an option',
                                          border:InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 25,),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey.withOpacity(0.3)),
                                          borderRadius: const BorderRadius.all(Radius.circular(8))
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        style: TextStyle(color: notifire.getMainText),
                                        dropdownColor: notifire.getcontiner,
                                        padding: const EdgeInsets.only(left: 10),
                                        value: selectedOption1,
                                        items: dropdownOptions2.map((String option) {
                                          return DropdownMenuItem<String>(
                                            value: option,
                                            child: Text(option),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedOption1 = newValue;
                                          });
                                        },
                                        decoration:  InputDecoration(
                                          hintStyle: mediumGreyTextStyle.copyWith(fontSize: 13),

                                          hintText: 'Select an option',
                                          border:InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: ComunTextField(title: "Card Number", hinttext: "Enter Number", controller: cardCvc)),
                              const SizedBox(width: 10,),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 25,),
                                      Text("Three or Four Digits,usually found on the back of the card",style: mediumGreyTextStyle),
                                    ],
                                  ))
                            ],
                          ),
                          const SizedBox(height: 20,),
                          ElevatedButton(

                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  fixedSize: const Size.fromHeight(40)
                              ),
                              onPressed: () {}, child: Text("Proceed",style: mediumBlackTextStyle.copyWith(color: Colors.white),)),

                        ]
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(child: ComunTextField(title: "Card Number", hinttext: "Enter Number", controller: cardNumber)),
                              const SizedBox(width: 10,),
                              Expanded(child: ComunTextField(title: "Card Holder", hinttext: "Enter Name", controller: cardHolder)),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Expiration Date",style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),),
                                    const SizedBox(height: 10,),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey.withOpacity(0.3)),
                                          borderRadius: const BorderRadius.all(Radius.circular(8))
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        style: TextStyle(color: notifire.getMainText),
                                        dropdownColor: notifire.getcontiner,
                                        padding: const EdgeInsets.only(left: 10),
                                        value: selectedOption,
                                        items: dropdownOptions1.map((String option) {
                                          return DropdownMenuItem<String>(
                                            value: option,
                                            child: Text(option),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedOption = newValue;
                                          });
                                        },
                                        decoration:  InputDecoration(
                                          hintStyle: mediumGreyTextStyle.copyWith(fontSize: 13),

                                          hintText: 'Select an option',
                                          border:InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 25,),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey.withOpacity(0.3)),
                                          borderRadius: const BorderRadius.all(Radius.circular(8))
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        style: TextStyle(color: notifire.getMainText),
                                        dropdownColor: notifire.getcontiner,
                                        padding: const EdgeInsets.only(left: 10),
                                        value: selectedOption1,
                                        items: dropdownOptions2.map((String option) {
                                          return DropdownMenuItem<String>(
                                            value: option,
                                            child: Text(option),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedOption1 = newValue;
                                          });
                                        },
                                        decoration:  InputDecoration(
                                          hintStyle: mediumGreyTextStyle.copyWith(fontSize: 13),

                                          hintText: 'Select an option',
                                          border:InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: ComunTextField(title: "Card Number", hinttext: "Enter Number", controller: cardCvc)),
                              const SizedBox(width: 10,),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 25,),
                                      Text("Three or Four Digits,usually found on the back of the card",style: mediumGreyTextStyle),
                                    ],
                                  ))
                            ],
                          ),
                          const SizedBox(height: 20,),
                          ElevatedButton(

                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  fixedSize: const Size.fromHeight(40)
                              ),
                              onPressed: () {}, child: Text("Proceed",style: mediumBlackTextStyle.copyWith(color: Colors.white),)),

                        ]
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildcompo6formobile(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
        color: notifire.getcontiner,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
          Row(
            children: [
              Expanded(child: _buildcharts())
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildpayment())
            ],
          ),
        ],),
      ),
    );
  }
  Widget _buildcompo6(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        // height: 390,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire.getcontiner,
          boxShadow: boxShadow,
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildcharts(),
                ),
                Expanded(
                  child:  _buildpayment(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<String> dropdownOptions1 = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

  List<String> dropdownOptions2 = ["2020", "2021", "2022", "2023",];

  String? selectedOption;

  String? selectedOption1;
}
class ChartData {
  ChartData(this.x, this.y, this.y1);
  final int x;
  final double y;
  final double y1;
}
