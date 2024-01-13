
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/sizebox.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';
import '../provider/proviercolors.dart';


class InvoicePage extends StatefulWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  bool istrue = false;

  TextEditingController projecttitle = TextEditingController();
  TextEditingController clientname = TextEditingController();

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
                      const ComunTitle(title: 'Invoice',path: "E-Commerce"),

                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: _buildinvoice(),
                      ),
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
                      const ComunTitle(title: 'Invoice',path: "E-Commerce"),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: _buildinvoice(),
                              )),
                        ],
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
              return      SizedBox(
                height: 1000,
                width: double.infinity,

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Invoice',path: "E-Commerce"),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: _buildinvoice(),
                              )),
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
  Widget _buildinvoice(){
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          // height: constraints.maxWidth<800? 890 : 850,
          decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),

          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      const SizedBox(width: 8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(radius:  constraints.maxWidth<600? 15 :20,backgroundImage: const AssetImage("assets/Logo.png"), backgroundColor: Colors.transparent),
                              const SizedBox(width: 8,),
                              Text("Buzz",style: TextStyle(fontSize: constraints.maxWidth<600? 16 :20,color: notifire!.getMainText,fontWeight: FontWeight.w700,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Text("Lorem Ipsum",style: TextStyle(fontSize: constraints.maxWidth<600? 14 :16,color: notifire!.getMainText,fontWeight: FontWeight.w700,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),),
                          const SizedBox(height: 8,),
                          Text("2955,Lorem Ipsum",style: TextStyle(fontSize:  constraints.maxWidth<600? 10 :13,color: notifire!.getMainText,fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),),
                          const SizedBox(height: 5,),
                          Text("loremipsum@gmail.com",style: TextStyle(fontSize:  constraints.maxWidth<600? 10 :13,color: notifire!.getMainText,fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),),
                          const SizedBox(height: 5,),
                          Text("289-335-6503",style: TextStyle(fontSize:  constraints.maxWidth<600? 10 :13,color: notifire!.getMainText,fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),),
                        ],
                      ),

                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Invoice",style: TextStyle(fontSize: constraints.maxWidth<600? 16 :20,color: notifire!.getMainText,fontWeight: FontWeight.w700,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Text("Lorem Ipsum",style: TextStyle(fontSize: constraints.maxWidth<600? 14 :16,color: notifire!.getMainText,fontWeight: FontWeight.w700,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),),
                          const SizedBox(height: 8,),
                          Text("Lorem No : 29",style: TextStyle(fontSize:  constraints.maxWidth<600? 10 :13,color: notifire!.getMainText,fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),),
                          const SizedBox(height: 5,),
                          Text("Date : 29-1-5-2005",style: TextStyle(fontSize:  constraints.maxWidth<600? 10 :13,color: notifire!.getMainText,fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),),
                          const SizedBox(height: 5,),
                          Text("295-955-2929",style: TextStyle(fontSize:  constraints.maxWidth<600? 10 :13,color: notifire!.getMainText,fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),),
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Billed To",style: TextStyle(fontSize: constraints.maxWidth<600? 16 :20,color: notifire!.getMainText,fontWeight: FontWeight.w700,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Text("Lorem Ipsum",style: TextStyle(fontSize: constraints.maxWidth<600? 14 :16,color: notifire!.getMainText,fontWeight: FontWeight.w700,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),),
                          const SizedBox(height: 8,),
                          Text("Lorem No : 29",style: TextStyle(fontSize:  constraints.maxWidth<600? 10 :13,color: notifire!.getMainText,fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),),
                          const SizedBox(height: 5,),
                          Text("Date : 29-1-5-2005",style: TextStyle(fontSize:  constraints.maxWidth<600? 10 :13,color: notifire!.getMainText,fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),),
                          const SizedBox(height: 5,),
                          Text("295-955-2929",style: TextStyle(fontSize:  constraints.maxWidth<600? 10 :13,color: notifire!.getMainText,fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),),
                        ],
                      ),



                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Table(
                  border: TableBorder.all(color: Colors.grey.shade200, width: 1),
                  columnWidths: const {
                    0: FlexColumnWidth(4),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                  },
                  children:  [
                    TableRow(
                      decoration: const BoxDecoration(
                        color: appMainColor
                      ),
                        children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 18,horizontal: constraints.maxWidth<600? 14 :18),
                        child: Text("Item Description", style: TextStyle(color: Colors.white,fontSize: constraints.maxWidth<600? 12 : 16.0,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy",),maxLines: 2,),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 18,horizontal: constraints.maxWidth<600? 14 :18),
                        child: Text("Hours", style: TextStyle(color: Colors.white,fontSize: constraints.maxWidth<600? 12 : 16.0,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),maxLines: 2),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 18,horizontal: constraints.maxWidth<600? 14 :18),
                        child: Text("Rate", style: TextStyle(color: Colors.white,fontSize: constraints.maxWidth<600? 12 : 16.0,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),maxLines: 2),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 18,horizontal: constraints.maxWidth<600? 14 :18),
                        child: Text("Sub-total", style: TextStyle(color: Colors.white,fontSize: constraints.maxWidth<600? 12 : 16.0,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis,fontFamily: "Gilroy"),maxLines: 2),
                      ),
                    ]),
                     TableRow(
                        children: [
                          Padding(
                              padding:  EdgeInsets.symmetric(vertical: 13,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Lorem Ipsum",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy")),
                                const SizedBox(height: 6,),
                                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy")),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("5",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy")),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("\$75",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy")),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("\$375.00",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy",overflow: TextOverflow.ellipsis)),
                          ),

                        ]),
                      TableRow(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 13,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Lorem Ipsum",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy")),
                                const SizedBox(height: 6,),
                                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy")),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("3",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy")),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("\$75",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy")),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("\$225.00",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy",overflow: TextOverflow.ellipsis)),
                          ),

                        ]),
                     TableRow(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 13,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Lorem Ipsum",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy")),
                                const SizedBox(height: 6,),
                                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy")),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("10",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy")),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("\$75",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy")),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("\$750.00",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy",overflow: TextOverflow.ellipsis)),
                          ),

                        ]),
                     TableRow(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 13,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Lorem Ipsum",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0)),
                                const SizedBox(height: 6,),
                                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy")),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("10",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy")),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("\$75",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy")),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("\$750.00",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy",overflow: TextOverflow.ellipsis)),
                          ),

                        ]),
                     TableRow(
                        children: [
                                const Text(""),

                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 12,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("HST",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy",)),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 12,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("13%",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy",)),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 12,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("\$419.25",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 10 : 14.0,fontFamily: "Gilroy",overflow: TextOverflow.ellipsis)),
                          ),

                        ]),
                     TableRow(
                        children: [

                                const Text(""),
                           Padding(
                            padding: EdgeInsets.symmetric(vertical: 20,horizontal: constraints.maxWidth<600? 5 :10),
                            child: const Text("",),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("Total",style: TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 12 : 16.0,fontWeight: FontWeight.w700,fontFamily: "Gilroy"),),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: constraints.maxWidth<600? 5 :10),
                            child: Text("\$3,644.25",style:  TextStyle(color: notifire!.getMainText,fontSize: constraints.maxWidth<600? 12 : 16.0,fontWeight: FontWeight.w700,fontFamily: "Gilroy",overflow: TextOverflow.ellipsis),maxLines: 2),
                          ),

                        ]),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            text:  TextSpan(
                              children: [
                            TextSpan(text: "Thank you for your business!",style: TextStyle(fontWeight: FontWeight.w700,color: notifire!.getMainText,fontFamily: "Gilroy",fontSize: constraints.maxWidth<600? 10 : 14.0)),
                            TextSpan(text: "   Payment is expected within 31 days; please process this invoice within that time.",style: TextStyle(color: notifire!.getMainText,fontWeight: FontWeight.w300,fontSize: constraints.maxWidth<600? 10 : 14.0) ),
                          ]),),
                          const SizedBox(height: 8,),
                           Text("There will be a 5% interest charge per month on late invoices.",style: TextStyle(color: notifire!.getMainText,fontFamily: "Gilroy",fontWeight: FontWeight.w300, overflow: TextOverflow.ellipsis,fontSize: constraints.maxWidth<600? 10 : 14.0))
                        ],
                      ),
                    ),
                    ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffffc439),
                          elevation: 0,

                        ),
                        child: const Text("Check Out",style: TextStyle(color: Colors.black,),))
                  ],
                ),
                const SizedBox(height: 20,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff7366ff),
                          elevation: 0,

                        ),
                        child: const Text("Print",style: TextStyle(color: Colors.white),)),
                    const SizedBox(width: 12,),

                    ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xfff73164),
                          elevation: 0,
                        ),
                        child: const Text("Cancel",style: TextStyle(color: Colors.white),))
                  ],
                ),
                const SizedBox(height: 12,),
              ],
            ),
          ),

        );
      }
    );
  }

}

