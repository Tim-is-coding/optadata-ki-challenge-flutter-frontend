import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/sizebox.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';
import '../provider/proviercolors.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool istrue = false;

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
                      const ComunTitle(title: 'Checkout', path: "E-Commerce"),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(padding),
                              child: SizedBox(
                                height: 1450,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildcomuntitle(),
                                    Divider(
                                      color: Colors.grey.shade300,
                                      height: 50,
                                    ),
                                    _buildform(),
                                    const SizedBox(height: 15,),
                                    _buildproducttotal(),
                                  ],
                                ),
                              ),
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
            } else if (constraints.maxWidth < 1000) {
              return SizedBox(
                height: 1000,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ComunTitle(title: 'Checkout', path: "E-Commerce"),
                      _buildcomuntitle(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(
                          color: Colors.grey.shade300,
                          height: 50,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(padding),
                              child: SizedBox(
                                height: 1450,
                                // decoration: BoxDecoration(
                                //   borderRadius: const BorderRadius.all(
                                //       Radius.circular(12)),
                                //   color: notifire!.getcontiner,
                                //   boxShadow: boxShadow,
                                // ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    _buildform(),
                                    const SizedBox(height: 15,),
                                    _buildproducttotal(),
                                  ],
                                ),
                              ),
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

              // Tablet layout
            } else {
              // Website layout
              return SizedBox(
                height: 1000,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Checkout', path: "E-Commerce"),
                      Row(
                        children: [
                          Expanded(
                            child: _buildBillingDetils(),
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

  Widget _buildBillingDetils() {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: SizedBox(
        height: 800,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildcomuntitle(),
            Divider(
              color: Colors.grey.shade300,
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildform(),
                const SizedBox(width: 15,),
                _buildproducttotal(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildcomuntextfild({required String titile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titile, style: TextStyle(color: notifire!.getMainText)),
        const SizedBox(
          height: 13,
        ),
        Container(
          height: 42,
          decoration: BoxDecoration(
              // color: Colors.white,
              border: Border.all(color: Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: TextField(
              style: TextStyle(color: notifire!.getMainText),
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: notifire!.getMainText),
                  hintText: '',
                  border: InputBorder.none),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget _buildform() {
    return Expanded(
      child: Container(
        height: 680,
        // color: Colors.white,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire!.getcontiner,
          boxShadow: boxShadow,
        ),
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: _buildcomuntextfild(titile: "First Name")),
                const SizedBox(
                  width: 20,
                ),
                Expanded(child: _buildcomuntextfild(titile: "Last Name")),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(child: _buildcomuntextfild(titile: "Phone")),
                const SizedBox(
                  width: 20,
                ),
                Expanded(child: _buildcomuntextfild(titile: "Email Address")),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(child: _buildcomuntextfild(titile: "Country")),
            const SizedBox(
              height: 5,
            ),
            Expanded(child: _buildcomuntextfild(titile: "Address")),
            const SizedBox(
              height: 5,
            ),
            Expanded(child: _buildcomuntextfild(titile: "Town/City")),
            const SizedBox(
              height: 5,
            ),
            Expanded(child: _buildcomuntextfild(titile: "State/Country")),
            const SizedBox(
              height: 5,
            ),
            Expanded(child: _buildcomuntextfild(titile: "Postal Code")),
            // Row(
            //   children: [
            //     Checkbox(
            //       shape: BeveledRectangleBorder(
            //           borderRadius: BorderRadius.circular(2)),
            //       side: BorderSide(color: Colors.grey.shade400),
            //       activeColor: const Color(0xff0d6efd),
            //       value: value,
            //       onChanged: (value) {
            //         setState(() {
            //           this.value = value!;
            //         });
            //       },
            //     ),
            //     Text(
            //       'Check me out',
            //       style: TextStyle(color: notifire!.getMainText),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildproducttotal() {
    return Expanded(
      child: Container(
        // height: 680,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire!.getcontiner,
          boxShadow: boxShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Table(
                children: [
                  TableRow(
                      children: [
                    Text("Product",style: mediumBlackTextStyle.copyWith(color:notifire!.getTextColor1,fontSize: 18),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Price",style: mediumBlackTextStyle.copyWith(color:notifire!.getTextColor1,fontSize: 18),),
                      ],
                    ),
                  ]),
                  const TableRow(children:  [
                    SizedBox(height: 12,),
                    SizedBox(height: 12,),
                  ]),
                  _buildrow(image: "assets/image01.png",price: "\$29",title: "Laptop Macos"),
                  _buildrow(image: "assets/wireless-inear-headphones-with-case-pink-background-flat-lay-min.jpg",price: "\$55",title: "Smart camera"),
                  _buildrow(image: "assets/image01.png",price: "\$515",title: "Pixel 33"),
                  _buildrow(image: "assets/ORH91S0-min.jpg",price: "\$15",title: "Jebble 6"),
                  _buildrow(image: "assets/image01.png",price: "\$120",title: "Air Pode"),

                  _buildrow1(title: "Sub Total :", price: "\$760"),
                  _buildrow1(title: "Discount :", price: "\$60"),
                  _buildrow1(title: "Shipping Charge :", price: "\$70"),
                  _buildrow1(title: "Estimated Tax :", price: "\$00"),
                    TableRow(
                    children: [
                    Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text("Total(Usd) :",style: mediumGreyTextStyle.copyWith(fontSize: 16,color: notifire!.getTextColor1),),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("\$555",style: mediumGreyTextStyle.copyWith(fontSize: 16,color: notifire!.getTextColor1),),
                      ],
                    ),
                  ),

                   ]
                  ),
                ],
              ),
              const SizedBox(height: 26,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red,fixedSize: const Size.fromHeight(35),elevation: 0),
                      onPressed: () {}, child: Text("Cancel",style: mediumBlackTextStyle.copyWith(color: Colors.white),)),
                  const SizedBox(width: 8,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: appMainColor,fixedSize: const Size.fromHeight(35),elevation: 0),
                      onPressed: () {}, child: Text("Processed",style: mediumBlackTextStyle.copyWith(color: Colors.white),)),
                ],
              ),
            ],
          ),


        ),
      ),
    );
  }

  TableRow _buildrow({required String title, required String price ,required String image}){
    return  TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              dense: true,
              contentPadding: const EdgeInsets.all(0),
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image:  DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
                ),
              ),
              title: Text(title,style: mediumGreyTextStyle,),),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(price,style: mediumBlackTextStyle.copyWith(color:notifire!.getMainText),),
              ],
            ),
          ),
        ]
    );
  }

  TableRow _buildrow1({required String title,required String price}){
    return TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(title,style: mediumGreyTextStyle,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(price,style: mediumGreyTextStyle,),
              ],
            ),
          ),

        ]
    );
  }

  Widget _buildcomuntitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15),
      child: Text(
        "Billing Details",
        style: TextStyle(
            color: notifire!.getMainText,
            fontWeight: FontWeight.w700,
            overflow: TextOverflow.ellipsis,
            fontSize: 20),
      ),
    );
  }
}


