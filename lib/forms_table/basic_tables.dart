
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/sizebox.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';
import '../provider/proviercolors.dart';



class BasicTablesPage extends StatefulWidget {
  const BasicTablesPage({Key? key}) : super(key: key);

  @override
  State<BasicTablesPage> createState() => _BasicTablesPageState();
}

class _BasicTablesPageState extends State<BasicTablesPage> {



  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifire>(
      builder: (context, value, child) => Container(
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
              return     SizedBox(
                height: 900,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Basic Table',path: "Forms & Table"),
                      _buildtable(width: constraints.maxWidth),
                      _buildtable2(width: constraints.maxWidth),
                      const SizeBoxx(),
                      const ComunBottomBar(),

                    ],
                  ),
                ),
              );
            } else if (constraints.maxWidth < 1200) {

              return     SizedBox(
                height: 1000,
                width: double.infinity,

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Basic Table',path: "Forms & Table"),

                      _buildtable(width: constraints.maxWidth),
                      _buildtable2(width: constraints.maxWidth),
                      const SizeBoxx(),
                      const ComunBottomBar(),


                    ],
                  ),
                ),
              );


            } else {
              // Website layout
              return   SizedBox(

                height: 1000,
                width: double.infinity,

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Basic Table',path: "Forms & Table"),
                      _buildtable(width: constraints.maxWidth),
                      _buildtable2(width: constraints.maxWidth),
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
  TableRow divider ({required Color color}){
    return   TableRow(
        children: [
          Divider(color: color,height: 30),
          Divider(color: color,height: 30),
          Divider(color: color,height: 30),
          Divider(color: color,height: 30),
          Divider(color: color,height: 30),
          Divider(color: color,height: 30),
          Divider(color: color,height: 30),
          Divider(color: color,height: 30),
        ]
    );
  }

  Widget _buildtable({required double width}){
    return  Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        // height:width<615? 595 :550,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("Basic Table With Border Bottom Color",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),

              Divider(color: Colors.grey.shade300,height: 60,),
              SizedBox(
                height: 380,
                width: width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      height: 400,
                      width: width<1220 ? 1500 : width,
                      child: SingleChildScrollView(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Table(
                                    columnWidths: const {
                                      0:FixedColumnWidth(80),
                                      1:FixedColumnWidth(260),

                                    },
                                    children:  [
                                       TableRow(
                                          children: [
                                            Text("SL No",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: appMainColor)),
                                            Text("Loan Money",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: appMainColor)),
                                            Text("Left to Repay",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: appMainColor)),
                                            Text("Duration",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: appMainColor)),
                                            Text("Interest Rate",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: appMainColor)),
                                            Text("Installment",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: appMainColor)),
                                            Text("Repay",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: appMainColor)),
                                            Center(child: Text("Country",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: appMainColor))),
                                          ]
                                      ),
                                      divider(color: const Color(0xff7366ff)),
                                      newRow(id: "01", loanmony: "\$10,000", lefttorepay: "\$40,550", duration: "8 Months", intrestrate: "12%", installment: "\$2932 / month"),
                                      divider(color:  Colors.red),
                                      newRow(id: "02", loanmony: "\$29,000", lefttorepay: "\$29,955", duration: "12 Months", intrestrate: "5%", installment: "\$2957 / month"),
                                      divider(color:  Colors.green),
                                      newRow(id: "03", loanmony: "\$55,460", lefttorepay: "\$21,555", duration: "8 Months", intrestrate: "15%", installment: "\$5671 / month"),
                                      divider(color:  Colors.blue),
                                      newRow(id: "04", loanmony: "\$35,256", lefttorepay: "\$21,555", duration: "11 Months", intrestrate: "4%", installment: "\$3245 / month"),
                                      divider(color:  Colors.orange),
                                      newRow(id: "05", loanmony: "\$12,346", lefttorepay: "\$34,567", duration: "1 Months", intrestrate: "20%", installment: "\$7145 / month"),
                                      divider(color:  Colors.deepOrange),
                                      newRow(id: "06", loanmony: "\$11,265", lefttorepay: "\$25,466", duration: "9 Months", intrestrate: "10%", installment: "\$1111 / month"),


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
              )




            ],
          ),
        ),

      ),
    );
  }


  Widget _buildtable2({required double width}){
    return  Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        // height:width<615? 595 :550,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire!.getcontiner,
          boxShadow: boxShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Basic Table",style: mainTextStyle.copyWith(overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 2),
              Divider(color: Colors.grey.shade300,height: 60,),
              SizedBox(
                height: 420,
                width: width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      height: 400,
                      width: width<1400 ? 1500 : width,
                      child: SingleChildScrollView(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Table(
                                    columnWidths: const {
                                      0:FixedColumnWidth(140),
                                      1:FixedColumnWidth(650),
                                    },
                                    children:  [

                                      TableRow(
                                          children: [
                                            Text("IMAGES",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                                            Text("PRODUCT NAME",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                                            Text("STOCK",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                                            Text("PRICE",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                                            Text("STATUS",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                                            Text("ACTIONS",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                                          ]
                                      ),
                                      const TableRow(
                                          children: [
                                            SizedBox(height: 12,),
                                            SizedBox(height: 12,),
                                            SizedBox(height: 12,),
                                            SizedBox(height: 12,),
                                            SizedBox(height: 12,),
                                            SizedBox(height: 12,),
                                          ]
                                      ),
                                      newRow12(title: "Nick Pro", subtitle: "\$10,000", lefttorepay: "40", duration: "\$150", intrestrate: "12%", installment: "\$2932 / month",isgreen: true),

                                      newRow12(title: "Macbook", subtitle:  "\$29,000", lefttorepay: "29", duration: "\$290", intrestrate: "5%", installment: "\$2957 / month",isgreen: true),

                                      newRow12(title: "Iphone 14", subtitle:  "\$55,460", lefttorepay: "21", duration: "\$950", intrestrate: "15%", installment: "\$5671 / month",isgreen: false),

                                      newRow12(title: "Instagram", subtitle:  "\$35,256", lefttorepay: "55", duration: "\$295", intrestrate: "4%", installment: "\$3245 / month",isgreen: true),

                                      newRow12(title: "FaceBook", subtitle:  "\$12,346", lefttorepay: "30", duration: "\$999", intrestrate: "20%", installment: "\$7145 / month",isgreen: false),

                                      newRow12(title: "Oppo", subtitle:  "\$11,265", lefttorepay: "25", duration: "\$959", intrestrate: "10%", installment: "\$1111 / month",isgreen: true),


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
              )




            ],
          ),
        ),

      ),
    );
  }

  TableRow newRow({required String id,required String loanmony,required String lefttorepay,required String duration,required String intrestrate,required String installment}){
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(id,style: TextStyle(color: notifire!.getMainText)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(loanmony,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(lefttorepay,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(duration,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(intrestrate,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(installment,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(installment,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:  30),
          child: Container(
            height: 30,
            width: 50,
            decoration: BoxDecoration(
              color: notifire!.getcontiner,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.withOpacity(0.3))
            ),
            child: Center(child: Text("Repay",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1)),
          ),
        ),
      ]
    );
  }
  TableRow newRow12({required String title,required String subtitle,required String lefttorepay,required String duration,required String intrestrate,required String installment,required bool isgreen}){
    return TableRow(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Stack(
            children: [
              CircleAvatar(backgroundImage: AssetImage("assets/avatar.png"),backgroundColor: Colors.transparent),
              Positioned(
                  left: 20,
                  child: CircleAvatar(backgroundImage: AssetImage("assets/avatar1.png"),backgroundColor: Colors.transparent,)),
              Positioned(
                  left: 40,
                  child: CircleAvatar(backgroundImage: AssetImage("assets/avatar2.png"),backgroundColor: Colors.transparent)),
            ],
          ),
        ),
         ListTile(
          dense: true,
          contentPadding: const EdgeInsets.all(0),
          title: Text(title,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(subtitle,style: mediumGreyTextStyle,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(lefttorepay,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(duration,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              SvgPicture.asset("assets/check.svg",height: 12,width: 12,color: isgreen? Colors.green : Colors.red),
              const SizedBox(width: 8,),
              Text( isgreen? "active":" Inactive",style: mediumBlackTextStyle.copyWith(color: isgreen? Colors.green.shade600 : Colors.red.shade600),overflow: TextOverflow.ellipsis,maxLines: 1),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              const Icon(Icons.edit,color: appGreyColor),
              const SizedBox(width: 4,),
              Text("Edite",style: mediumBlackTextStyle.copyWith(color: appGreyColor),overflow: TextOverflow.ellipsis,maxLines: 1),
              const SizedBox(width: 10,),
              const Icon(Icons.delete,color: Colors.red),
              const SizedBox(width: 4,),
              Text("Delete",style: mediumBlackTextStyle.copyWith(color: Colors.red),overflow: TextOverflow.ellipsis,maxLines: 1),
            ],
          ),
        ),
      ]
    );
  }


  TableRow row ({required String id,required String firstname,required String image,required String lastname,required String username,required String designation,required String company,required String language,required String country,required Color color}){
    return   TableRow(
        children: [
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 5),
             child: Text(id,style: TextStyle(color: notifire!.getMainText)),
           ),
          Row(
            children: [
              SizedBox(
                height: 28,
                width: 28,
                child: Image.asset(image,fit: BoxFit.fill),

              ),
              const SizedBox(width: 10,),
               Text(firstname,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1,),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(lastname,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(username,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(designation,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(company,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1),
          ),
          Row(
            children: [
              Container(
                  height: 28,
                  width: 50,
                  decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(child:  Text(language,style: mediumBlackTextStyle.copyWith(color: color),overflow: TextOverflow.ellipsis,maxLines: 1))),
            ],
          ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 5),
             child: Text(country,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),overflow: TextOverflow.ellipsis,maxLines: 1),
           ),
        ]
    );
  }
}

