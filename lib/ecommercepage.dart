
import 'package:flutter/material.dart';

class EcommercePage extends StatefulWidget {
  const EcommercePage({Key? key}) : super(key: key);

  @override
  State<EcommercePage> createState() => _EcommercePageState();
}

class _EcommercePageState extends State<EcommercePage> {



  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xfff2f3f6),

      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            // Mobile layout
            return  SizedBox(
              height: 900,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    _buildTotalBalance(),
                  ],
                ),
              ),
            );
          } else if (constraints.maxWidth < 1200) {
            if(constraints.minWidth < 1000){
              return  SizedBox(
                height: 1000,
                width: double.infinity,

                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: _buildTotalBalance()
                          ),

                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 350,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 350,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 350,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 350,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 350,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 350,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 350,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              );


            } else{
              return SizedBox(
                height: 1000,
                width: double.infinity,

                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: _buildTotalBalance()
                          ),

                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 350,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 350,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 350,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 350,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 350,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 350,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 350,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              );
            }
            // Tablet layout

          } else {
            // Website layout
            return  SizedBox(
              height: 1000,
              width: double.infinity,

              child: SingleChildScrollView(
                child: Column(
                  children: [


                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [

                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: _buildTotalBalance()
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 380,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 380,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 380,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 380,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 380,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 380,
                                        color: Colors.deepPurple,

                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 380,
                                                color: Colors.red,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 380,
                                                color: Colors.yellow,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )

                            ],
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 1200,
                              color: Colors.deepPurple,

                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

 Widget _buildTotalBalance(){

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 380,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer,
                          spreadRadius: 5
                      )
                    ]
                ),
                child:  Row(
                  children: [
                   const Expanded(
                     flex: 3,
                     child: SizedBox(
                       height: 150,
                       child: Column(
                         children: [
                           Text("Total Balance",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                         ],
                       ),
                     ),
                   ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 150,

                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 7,top: 7),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 5,
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 5
                            )
                          ]
                      ),
                    ),
                  ),
                  const SizedBox(width: 14,),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 5,
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 5
                            )
                          ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 5,
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 5
                            )
                          ]
                      ),
                    ),
                  ),
                  const SizedBox(width: 14,),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 5,
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 5
                            )
                          ]
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
 }



}

