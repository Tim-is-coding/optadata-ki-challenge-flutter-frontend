// ignore_for_file: deprecated_member_use

import 'package:buzz/api/rest/api.dart';
import 'package:buzz/appstaticdata/staticdata.dart';
import 'package:buzz/model/lightabrechnungsprecheckresponse.dart';
import 'package:buzz/model/lightabrechnungsrequest.dart';
import 'package:buzz/model/lightabrechnungsresponse.dart';
import 'package:buzz/provider/proviercolors.dart';
import 'package:buzz/widgets/NotImplementedYetScreen.dart';
import 'package:buzz/widgets/comuntitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ribbon_widget/ribbon_widget.dart';

class EnterAbrechnungsRequestScreen extends StatefulWidget {
  const EnterAbrechnungsRequestScreen({Key? key}) : super(key: key);

  @override
  State<EnterAbrechnungsRequestScreen> createState() =>
      _EnterAbrechnungsRequestScreenState();
}

class _EnterAbrechnungsRequestScreenState
    extends State<EnterAbrechnungsRequestScreen> {
  ColorNotifire notifire = ColorNotifire();

  late LightAbrechnungsrequest _lightAbrechnungsrequest;
  LightAbrechnungsResult? _lightAbrechnungsResult;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey _scrollToKey = GlobalKey();
  final GlobalKey _topScrollKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _ikController = TextEditingController();
  final TextEditingController _BdayController = TextEditingController();

  bool _processingRequest = false;
  bool _processingFinished = false;
  bool _hitSubmit = false;
  double _width = 0;

  @override
  void initState() {
    super.initState();
    _lightAbrechnungsrequest = _makeStartSetting();

    // _lightAbrechnungsrequest.krankenkassenIk = "100189483";
    // _lightAbrechnungsrequest.patientBirthday = "01.01.1980";
    // _lightAbrechnungsrequest.productDeliveries![0].deliveryDate = "01.01.2021";
    //
    // _lightAbrechnungsrequest.productDeliveries![0].deliveredProducts![0] =
    //     LightAbrechnungsRequesProduct();
    // _lightAbrechnungsrequest.productDeliveries![0].deliveredProducts![0]
    //     .hilfmittelnummer = "15.25.30.5033";
    // _lightAbrechnungsrequest
    //     .productDeliveries![0].deliveredProducts![0].amount = 1;
    //
    // _lightAbrechnungsrequest.productDeliveries![0].deliveredProducts!
    //     .add(LightAbrechnungsRequesProduct());
    // _lightAbrechnungsrequest.productDeliveries![0].deliveredProducts![1]
    //     .hilfmittelnummer = "15.25.31.2042";
    // _lightAbrechnungsrequest
    //     .productDeliveries![0].deliveredProducts![1].amount = 1;
  }

  void _clearAllTextFields() {
    _ikController.clear();
    _BdayController.clear();
  }

  LightAbrechnungsrequest _makeStartSetting() {
    LightAbrechnungsrequest lightAbrechnungsrequest = LightAbrechnungsrequest();

    var lightAbrechnungsRequestProductDelivery =
        LightAbrechnungsRequestProductDelivery();

    var lightAbrechnungsRequestProduct = LightAbrechnungsRequesProduct();
    lightAbrechnungsRequestProduct.amount = 1;

    lightAbrechnungsRequestProductDelivery.deliveredProducts = [
      lightAbrechnungsRequestProduct
    ];
    lightAbrechnungsrequest.productDeliveries = [
      lightAbrechnungsRequestProductDelivery
    ];

    return lightAbrechnungsrequest;
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: !_processingFinished
          ? ElevatedButton(
              onPressed: _processingRequest
                  ? null
                  : () {
                      setState(() {
                        _hitSubmit = true;
                      });

                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _processingRequest = true;
                        });

                        var response = AbrechnungLiteApi()
                            .requestAbrechnungLite(
                                lightAbrechnungsRequest:
                                    _lightAbrechnungsrequest);
                        response.then((value) {
                          setState(() {
                            _processingRequest = false;
                            _processingFinished = true;
                            _lightAbrechnungsResult = value;
                          });
                          Future.delayed(const Duration(milliseconds: 50), () {
                            _scrollToResults();
                          });
                        });
                        response.catchError((error) {
                          setState(() {
                            _processingRequest = false;
                          });
                        });

                        // call API
                      }
                    },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(40),
                  elevation: 10,
                  //shadowColor: Colors.grey.shade300,
                  side: BorderSide(
                      color: false ? Colors.grey.shade300 : Colors.transparent),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  backgroundColor: const Color(0xFF1A438F)),
              child: const Text(
                "Abrechnungshilfe erstellen",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    //fontWeight: FontWeight.w500,
                    color: Colors.white),
              ))
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: LayoutBuilder(
          builder: (context, constraints) {
            _width = constraints.maxWidth;
            if (constraints.maxWidth < 600) {
              return NotImplementedYetScreen("Neue Abrechnung");
            } else {
              return Form(
                  key: _formKey,
                  // Ein GlobalKey<FormState>, um das Formular später zu validieren
                  child: Column(
                    children: [
                      ComunTitle(
                          key: _topScrollKey,
                          title: 'Neue Abrechnung',
                          path: "Abrechnung"),
                      Padding(
                        padding: const EdgeInsets.all(padding),
                        child: Container(
                            decoration: BoxDecoration(
                              color: notifire.getcontiner,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: buildContent(false,
                                size: constraints.maxWidth)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(children: [
                            const SizedBox(
                              height: 30,
                            ),
                            // SvgPicture.asset(
                            //   "assets/arrow_down.svg",
                            //   width: 50,
                            //   height: 50,
                            // ),
                            // const SizedBox(
                            //   height: 30,
                            // ),y
                            const SizedBox(
                              height: 30,
                            ),
                            if (_processingRequest)
                              CircularProgressIndicator(
                                key: _scrollToKey,
                                color: Colors.lightGreen,
                              ),
                            if (_processingRequest)
                              const SizedBox(
                                height: 1500,
                              ),
                          ])
                        ],
                      ),
                      if (_processingFinished) _processingFinishedWidget(),
                    ],
                  ));
            }
          },
        ),
      ),
    );
  }

  Future<bool> _canBeAbgerechnet(String hilfmittelnummer) async {
    var cloneOfRequest = LightAbrechnungsrequest();
    cloneOfRequest.krankenkassenIk = _lightAbrechnungsrequest.krankenkassenIk;
    cloneOfRequest.patientBirthday = _lightAbrechnungsrequest.patientBirthday;

    LightAbrechnungsRequestProductDelivery productDelivery =
        LightAbrechnungsRequestProductDelivery();
    productDelivery.deliveryDate =
        _lightAbrechnungsrequest.productDeliveries![0].deliveryDate;

    LightAbrechnungsRequesProduct product = LightAbrechnungsRequesProduct();
    product.hilfmittelnummer = hilfmittelnummer;
    product.amount = 1;

    productDelivery.deliveredProducts = [product];
    cloneOfRequest.productDeliveries = [productDelivery];

    try {
      var result = await AbrechnungLiteApi().requestAbrechnungLitePrecheck(
          lightAbrechnungsRequest: cloneOfRequest);
      print(result!.success!);
      return result.success!;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void _scrollToResults() {
    // Erhalten Sie den RenderBox des Widgets und damit seine Position
    final RenderBox renderBox =
        _scrollToKey.currentContext?.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    // Scrollen Sie zu der berechneten Offset-Position des RenderBox
    _scrollController.animateTo(
      position.dy,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Widget buildContent(bool bigMode, {required double size}) {
    bigMode = size > 1200;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 20,
                width: 7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(0.3)),
              ),
              const SizedBox(width: 5),
              Text(
                "Patientendaten",
                style: TextStyle(
                    color: notifire.getbacktextcolors,
                    fontWeight: FontWeight.w800,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 18),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Krankenkassen-IK",
                      style: TextStyle(
                          color: notifire.getbacktextcolors,
                          fontWeight: FontWeight.w800,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Über die IK der Krankenkasse kann der\nrichtige Vertrag ausgewählt werden.",
                      style: TextStyle(
                          color: notifire.getsubcolors,
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 22,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 23, left: 50, right: 20),
                    child: TextFormField(
                        controller: _ikController,
                        autovalidateMode: _hitSubmit
                            ? AutovalidateMode.always
                            : AutovalidateMode.disabled,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bitte geben Sie eine Krankenkassen-IK ein.';
                          }
                          final RegExp ikRegex = RegExp(r'^[1-9]\d{8}$');
                          return ikRegex.hasMatch(value)
                              ? null
                              : 'Bitte geben Sie eine gültige Krankenkassen-IK ein.';
                        },
                        //initialValue: _lightAbrechnungsrequest.krankenkassenIk,
                        onChanged: (value) {
                          setState(() {
                            _lightAbrechnungsrequest.krankenkassenIk = value;
                            _processingFinished = false;
                          });
                        },
                        style: mediumBlackTextStyle.copyWith(
                            color: notifire.getMainText),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.3),
                          )),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.3),
                          )),
                          labelText: 'Krankenkassen-IK eingeben',
                          labelStyle: mediumGreyTextStyle,
                        )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      "Geburtsdatum",
                      style: TextStyle(
                          color: notifire.getbacktextcolors,
                          fontWeight: FontWeight.w800,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Das Geburtsdatum wird benötigt, da manche\nVerträge nach Alter gestaffelt sind.",
                      style: TextStyle(
                          color: notifire.getsubcolors,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 33, left: 47, right: 20),
                    child: TextFormField(
                        controller: _BdayController,
                        onChanged: (value) {
                          setState(() {
                            _lightAbrechnungsrequest.patientBirthday = value;
                            _processingFinished = false;
                          });
                        },
                        //initialValue: _lightAbrechnungsrequest.patientBirthday,
                        autovalidateMode: _hitSubmit
                            ? AutovalidateMode.always
                            : AutovalidateMode.disabled,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bitte geben Sie ein Geburtsdatum ein.';
                          }

                          final RegExp dateRegex =
                              RegExp(r'^\d{2}\.\d{2}\.\d{4}$');
                          if (!dateRegex.hasMatch(value)) {
                            return 'Das Datum muss im Format TT.MM.JJJJ sein';
                          }

                          try {
                            DateFormat("dd.MM.yyyy").parseStrict(value);
                            return null;
                          } on FormatException {
                            return 'Bitte geben Sie ein gültiges Datum ein';
                          }
                        },
                        style: mediumBlackTextStyle.copyWith(
                            color: notifire.getMainText),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.3),
                          )),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3))),
                          labelText: 'Geburtsdatum eingeben',
                          labelStyle: mediumGreyTextStyle,
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 20,
                width: 7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(0.3)),
              ),
              const SizedBox(width: 5),
              Text(
                "Lieferungen",
                style: TextStyle(
                    color: notifire.getbacktextcolors,
                    fontWeight: FontWeight.w800,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 18),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Bitte pro Lieferung alle abgelieferten Produkte auflisten. Die Reihenfolge der Lieferungen ist nicht relevant.",
              style: TextStyle(
                  color: notifire.getsubcolors,
                  fontSize: 13,
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(child: _buildLieferungenWidget(size: bigMode ? 3 : 2)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // row with centered items
          ],
        ),
      ),
    );
  }

  Widget _processingFinishedWidget() {
    return Column(
      children: [
        // centered row
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Ihr Ergebnis ist fertig!",
              style: TextStyle(
                  color: notifire.getbacktextcolors,
                  fontWeight: FontWeight.w800,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 22),
            ),
          ),
        ),

        const SizedBox(
          height: 30,
        ),
        _buildResultArea(count: 4),
        //_buildtable2(width: _width - 200),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            SizedBox(
              width: 50,
            ),
            _buildOutlineLargeButton(
                title: "Bearbeiten",
                color: const Color(0xff1a438f),
                onPressed: () {
                  setState(() {
                    _processingFinished = false;
                  });
                  _navigateToTop();
                }),
            const SizedBox(
              width: 20,
            ),
            _buildOutlineLargeButton(
                title: "Neue Abrechnung",
                color: const Color(0xff54ba4a),
                onPressed: () {
                  setState(() {
                    _hitSubmit = false;
                    _processingFinished = false;
                    _lightAbrechnungsrequest = _makeStartSetting();
                    _clearAllTextFields();
                  });
                  LightAbrechnungsRequestProductDelivery
                      lightAbrechnungsRequestProductDelivery =
                      LightAbrechnungsRequestProductDelivery();
                  var lightAbrechnungsRequesProduct =
                      LightAbrechnungsRequesProduct();
                  lightAbrechnungsRequesProduct.amount = 1;
                  lightAbrechnungsRequestProductDelivery.deliveredProducts = [
                    lightAbrechnungsRequesProduct
                  ];

                  setState(() {
                    _lightAbrechnungsrequest.productDeliveries = [];
                  });
                  _navigateToTop();
                }),
          ],
        ),
        SizedBox(
          key: _scrollToKey,
          height: 80,
        ),
      ],
    );
  }

  void _navigateToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildOutlineLargeButton(
      {required String title,
      required Color color,
      Color? textcolor,
      bool bordertrue = false,
      required Function() onPressed}) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          elevation: 0,
          side: BorderSide(color: color),
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        ),
        child: Text(
          title,
          style: TextStyle(color: textcolor ?? color, fontSize: 17),
        ));
  }

  Widget _buildLieferungenWidget({required int size}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: notifire.getbgcolor,
        boxShadow: boxShadow,
      ),
      child: SizedBox(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
                child: Wrap(
                  spacing: 10, // horizontal spacing between items
                  runSpacing: 10, // vertical spacing between items
                  children: List.generate(
                      _lightAbrechnungsrequest.productDeliveries!.length + 1,
                      (index) {
                    if (index ==
                        _lightAbrechnungsrequest.productDeliveries!.length) {
                      return _buildAddCard();
                    }
                    return _buildLieferungsCard(index);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLieferungsCard(int index) {
    return SizedBox(
        height: 600,
        width: 460,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Theme(
                  data: ThemeData(
                    cardTheme: const CardTheme(
                        elevation: 1,
                        color: Colors.white, // Custom card background color
                        surfaceTintColor: Colors.white),
                  ),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 20,
                                width: 7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.grey.withOpacity(0.3)),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Lieferung ${index + 1}",
                                style: TextStyle(
                                    color: notifire.getbacktextcolors,
                                    fontWeight: FontWeight.w800,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 18),
                              ),
                              const Spacer(),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _processingFinished = false;
                                      _lightAbrechnungsrequest
                                          .productDeliveries!
                                          .removeAt(index);
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    "assets/trash.svg",
                                    height: 20,
                                    width: 20,
                                    color: appGreyColor,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 30),
                                  Text(
                                    "Lieferdatum",
                                    style: TextStyle(
                                        color: notifire.getbacktextcolors,
                                        fontWeight: FontWeight.w800,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Das Lieferdatum bestimmt\nden Abrechnungszeitraum.",
                                    style: TextStyle(
                                        color: notifire.getsubcolors,
                                        fontSize: 12,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 33, left: 47, right: 20),
                                  child: TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          _processingFinished = false;
                                          _lightAbrechnungsrequest
                                              .productDeliveries![index]
                                              .deliveryDate = value;
                                        });
                                      },
                                      autovalidateMode: _hitSubmit
                                          ? AutovalidateMode.always
                                          : AutovalidateMode.disabled,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Bitte geben Sie ein Lieferdatum ein.';
                                        }

                                        final RegExp dateRegex =
                                            RegExp(r'^\d{2}\.\d{2}\.\d{4}$');
                                        if (!dateRegex.hasMatch(value)) {
                                          return 'Format TT.MM.JJJJ erforderlich';
                                        }

                                        try {
                                          DateFormat("dd.MM.yyyy")
                                              .parseStrict(value);
                                          return null;
                                        } on FormatException {
                                          return 'Bitte geben Sie ein gültiges Datum ein';
                                        }
                                      },
                                      style: mediumBlackTextStyle.copyWith(
                                          color: notifire.getMainText),
                                      // initialValue: _lightAbrechnungsrequest
                                      //     .productDeliveries![index]
                                      //     .deliveryDate,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.3),
                                        )),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey
                                                    .withOpacity(0.3))),
                                        labelText: 'Lieferdatum eingeben',
                                        labelStyle: mediumGreyTextStyle,
                                      )),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child:
                                  Divider(color: Colors.grey.withOpacity(0.3))),
                          const SizedBox(
                            height: 8,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _getProductRows(_lightAbrechnungsrequest
                              .productDeliveries![index]),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ));
  }

  Widget _getProductRows(
      LightAbrechnungsRequestProductDelivery productDelivery) {
    List<Widget> rows = [];
    int counter = 0;
    for (var product in productDelivery.deliveredProducts!) {
      rows.add(_getProductRow(productDelivery, counter++));
      rows.add(const SizedBox(
        height: 20,
      ));
    }

    rows.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 270,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _processingFinished = false;
                    var lightAbrechnungsRequestProduct =
                        LightAbrechnungsRequesProduct();
                    lightAbrechnungsRequestProduct.amount = 1;
                    productDelivery.deliveredProducts!
                        .add(lightAbrechnungsRequestProduct);
                  });
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: const Size.fromHeight(40),
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.grey.withOpacity(0.2)),
                child: Text(
                  "Weiteres Produkt hinzufügen",
                  style: mediumBlackTextStyle.copyWith(
                      color: notifire.getTextColor1),
                ))),
      ],
    ));

    return SizedBox(
        height: 280,
        child: ListView(
          shrinkWrap: true,
          children: rows,
        ));
  }

  Widget _getProductRow(
      LightAbrechnungsRequestProductDelivery delivery, int index) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${index + 1}.",
              style: TextStyle(
                  color: notifire.getbacktextcolors,
                  fontWeight: FontWeight.w800,
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextFormField(
                  autovalidateMode: _hitSubmit
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Bitte etwas eingeben';
                    }
                    final regex = RegExp(r'^\d{2}\.');
                    if (!regex.hasMatch(value)) {
                      return 'Gültige Hilfsmittelnummer eingeben';
                    }

                    return null;
                  },
                  // initialValue:
                  //     delivery.deliveredProducts![index].hilfmittelnummer,
                  onChanged: (value) {
                    setState(() {
                      _processingFinished = false;
                      delivery.deliveredProducts![index].hilfmittelnummer =
                          value;
                    });

                    if (delivery.deliveredProducts![index].hilfmittelnummer ==
                            null ||
                        delivery.deliveredProducts![index].hilfmittelnummer!
                                .length <
                            8) {
                      delivery.deliveredProducts![index].precheckResult = null;
                      return;
                    }
                    final regex = RegExp(r'^\d{2}\.');
                    var valid = regex.hasMatch(
                        delivery.deliveredProducts![index].hilfmittelnummer!);
                    if (valid) {
                      _canBeAbgerechnet(delivery
                              .deliveredProducts![index].hilfmittelnummer!)
                          .then((value) {
                        setState(() {
                          delivery.deliveredProducts![index].precheckResult =
                              LightAbrechnungsPrecheckResult();
                          delivery.deliveredProducts![index].precheckResult!
                              .success = value;
                        });
                      });
                    }
                  },
                  style: mediumBlackTextStyle.copyWith(
                      color: notifire.getMainText),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color:
                          (delivery.deliveredProducts![index].precheckResult !=
                                      null &&
                                  delivery.deliveredProducts![index]
                                      .precheckResult!.success!)
                              ? Colors.lightGreen.withOpacity(0.3)
                              : Colors.grey.withOpacity(0.3),
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color:
                          (delivery.deliveredProducts![index].precheckResult !=
                                      null &&
                                  delivery.deliveredProducts![index]
                                      .precheckResult!.success!)
                              ? Colors.lightGreen
                              : Colors.grey.withOpacity(0.6),
                    )),
                    labelText:
                        (delivery.deliveredProducts![index].precheckResult !=
                                    null &&
                                delivery.deliveredProducts![index]
                                    .precheckResult!.success!)
                            ? 'Abrechenbar'
                            : 'Hilfsmittelnummer',
                    labelStyle: mediumGreyTextStyle.copyWith(
                      color:
                          (delivery.deliveredProducts![index].precheckResult !=
                                      null &&
                                  delivery.deliveredProducts![index]
                                      .precheckResult!.success!)
                              ? Colors.lightGreen
                              : Colors.grey.withOpacity(0.6),
                    ),
                  )),
            ),
            const SizedBox(
              width: 30,
            ),
            _counter(delivery.deliveredProducts![index], delivery, index),
            const SizedBox(
              width: 30,
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    if (delivery.deliveredProducts!.length > 1) {
                      delivery.deliveredProducts!.removeAt(index);
                      _processingFinished = false;
                    }
                  });
                },
                child: SvgPicture.asset("assets/trash.svg",
                    height: 18, width: 18, color: appGreyColor)),
          ],
        ));
  }

  Widget _counter(LightAbrechnungsRequesProduct product,
      LightAbrechnungsRequestProductDelivery delivery, int productIndex) {
    if (product.precheckResult != null) {
      if (!product.precheckResult!.success!) {
        return Container(
            height: 35,
            width: 119,
            padding: const EdgeInsets.all(3),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/error.png",
                        height: 19,
                        width: 19,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Vertrag fehlt",
                          style: mediumBlackTextStyle.copyWith(
                              fontSize: 14, color: notifire.getMainText)),
                    ],
                  ),
                ]));
      }
    }
    return Row(children: [
      const SizedBox(
        width: 10,
      ),
      Container(
        height: 35,
        width: 100,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: notifire.getbordercolor,
            borderRadius: BorderRadius.circular(14)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          InkWell(
              onTap: () {
                setState(() {
                  if (product.amount! > 1) {
                    product.amount = product.amount! - 1;
                    _processingFinished = false;
                  } else {
                    // delete product
                    delivery.deliveredProducts!.removeAt(productIndex);
                    _processingFinished = false;
                  }
                });
              },
              child: Image.asset("assets/ic_minus_top.png")),
          Text("${product.amount}",
              style: mediumBlackTextStyle.copyWith(
                  fontSize: 18, color: notifire.getMainText)),
          InkWell(
              onTap: () {
                setState(() {
                  product.amount = product.amount! + 1;
                  _processingFinished = false;
                });
              },
              child: Image.asset("assets/ic_plus_top.png")),
        ]),
      ),
      const SizedBox(
        width: 9,
      ),
    ]);
  }

  Widget _buildAddCard() {
    return SizedBox(
        height: 600,
        width: 450,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Theme(
              data: ThemeData(
                cardTheme:
                    const CardTheme(elevation: 0, color: Colors.transparent),
              ),
              child: Card(
                elevation: 0,
                shadowColor: Colors.transparent,
                //color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        hoverColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _processingFinished = false;
                            var lightAbrechnungsRequestProductDelivery =
                                LightAbrechnungsRequestProductDelivery();
                            var lightAbrechnungsRequestProduct =
                                LightAbrechnungsRequesProduct();
                            lightAbrechnungsRequestProduct.amount = 1;
                            lightAbrechnungsRequestProductDelivery
                                .deliveredProducts = [
                              lightAbrechnungsRequestProduct
                            ];
                            _lightAbrechnungsrequest.productDeliveries!
                                .add(lightAbrechnungsRequestProductDelivery);
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/plus.svg",
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Lieferung hinzufügen",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ],
                        )),
                  ],
                ),
              )),
        ));
  }

  Widget _buildResultArea({required int count}) {
    return SizedBox(
        width: _width - 200,
        child: Wrap(
            spacing: 10, // horizontal spacing between items
            runSpacing: 10, // vertical spacing between items
            children:
                List.generate(_lightAbrechnungsResult!.items!.length, (index) {
              if (_lightAbrechnungsResult!.items![index].success!) {
                return _successCard(_lightAbrechnungsResult!.items![index]);
              } else {
                return _failureCard(_lightAbrechnungsResult!.items![index]);
              }
            })));
  }

  Widget _failureCard(LightAbrechnungsResultIItem item) {
    return SizedBox(
        width: 310,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Theme(
              data: ThemeData(
                cardTheme: const CardTheme(
                    elevation: 1,
                    color: Colors.white, // Custom card background color
                    surfaceTintColor: Colors.white),
              ),
              child: Ribbon(
                  nearLength: 45,
                  farLength: 75,
                  title: '',
                  titleStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  color: item.pauschaleAlreadyCoveredy!
                      ? const Color(0xFFf4c847)
                      : Colors.deepOrange,
                  location: RibbonLocation.topEnd,
                  child: Card(
                    margin: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.transparent,
                            backgroundImage: item.urlToImage == null
                                ? const AssetImage("assets/hilfsmittel.png")
                                : NetworkImage(item.urlToImage!)
                                    as ImageProvider),
                        const SizedBox(
                          height: 10,
                        ),

                        Text(item.displayName,
                            style: mediumBlackTextStyle.copyWith(
                                fontSize: 16, color: notifire.getMainText)),
                        // Text("@brookly.simmons",style: mediumGreyTextStyle),
                        const SizedBox(
                          height: 55,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              item.pauschaleAlreadyCoveredy!
                                  ? "assets/warn.png"
                                  : "assets/error.png",
                              height: 22,
                              width: 22,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                                item.pauschaleAlreadyCoveredy!
                                    ? "Pauschale abgedeckt"
                                    : "Vertrag fehlt",
                                style: mediumBlackTextStyle.copyWith(
                                    fontSize: 16, color: notifire.getMainText)),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // grey text explaining the error
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: Text(
                                    item.pauschaleAlreadyCoveredy!
                                        ? "Die Pauschale des Hilfsmittels wird bereits durch eine andere Position abgedeckt."
                                        : "Der benötigte Vertrag ist noch nicht hinterlegt. SaniUp wird automatisch informiert.",
                                    textAlign: TextAlign.center,
                                    style: mediumGreyTextStyle.copyWith(
                                        fontSize: 16)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ))),
        ));
  }

  Widget _successCard(LightAbrechnungsResultIItem item) {
    return SizedBox(
        width: 310,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Theme(
              data: ThemeData(
                cardTheme: const CardTheme(
                    elevation: 1,
                    color: Colors.white, // Custom card background color
                    surfaceTintColor: Colors.white),
              ),
              child: Ribbon(
                  nearLength: 45,
                  farLength: 75,
                  title: '',
                  titleStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  color: Colors.lightGreen,
                  location: RibbonLocation.topEnd,
                  child: Card(
                    margin: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.transparent,
                            backgroundImage: item.urlToImage == null
                                ? const AssetImage("assets/hilfsmittel.png")
                                : NetworkImage(item.urlToImage!)
                                    as ImageProvider),
                        const SizedBox(
                          height: 10,
                        ),

                        Text(item.displayName,
                            style: mediumBlackTextStyle.copyWith(
                                fontSize: 16, color: notifire.getMainText)),
                        // Text("@brookly.simmons",style: mediumGreyTextStyle),
                        const SizedBox(
                          height: 35,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Column(
                                children: [
                                  Text("Brutto",
                                      style: mediumGreyTextStyle.copyWith(
                                          fontSize: 16,
                                          color: notifire.getMainText)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("${item.bruttoPreis!}€",
                                      style: mediumBlackTextStyle,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height: 20,
                                child: VerticalDivider(
                                    color: Colors.grey, width: 35)),
                            Flexible(
                              child: Column(
                                children: [
                                  Text("Netto",
                                      style: mediumGreyTextStyle.copyWith(
                                          fontSize: 16,
                                          color: notifire.getMainText)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("${item.nettoPreis!}€",
                                      style: mediumBlackTextStyle,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height: 20,
                                child: VerticalDivider(
                                    color: Colors.grey, width: 35)),
                            Flexible(
                              child: Column(
                                children: [
                                  Text("Legs",
                                      style: mediumGreyTextStyle.copyWith(
                                          fontSize: 16,
                                          color: notifire.getMainText)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(item.lex!,
                                      style: mediumBlackTextStyle,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Divider(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Column(
                                children: [
                                  Text("MwSt",
                                      style: mediumGreyTextStyle.copyWith(
                                          fontSize: 16,
                                          color: notifire.getMainText)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("${item.mwst!}€",
                                      style: mediumBlackTextStyle,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height: 20,
                                child: VerticalDivider(
                                    color: Colors.grey, width: 35)),
                            Flexible(
                              child: Column(
                                children: [
                                  Text("Faktor",
                                      style: mediumGreyTextStyle.copyWith(
                                          fontSize: 16,
                                          color: notifire.getMainText)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("${item.faktor!}",
                                      style: mediumBlackTextStyle,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height: 20,
                                child: VerticalDivider(
                                    color: Colors.grey, width: 35)),
                            Flexible(
                              child: Column(
                                children: [
                                  Text("Zuzahlen",
                                      style: mediumGreyTextStyle.copyWith(
                                          fontSize: 16,
                                          color: notifire.getMainText)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("${item.zuzahlung!}€",
                                      style: mediumBlackTextStyle,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))),
        ));
  }

  Widget _buildTableResultView({required double width}) {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Theme(
          data: ThemeData(
            cardTheme: const CardTheme(
                elevation: 1,
                color: Colors.white, // Custom card background color
                surfaceTintColor: Colors.white),
          ),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Abgerechnete Positionen",
                      style: mainTextStyle.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: notifire.getMainText),
                      maxLines: 2),
                  Divider(
                    color: Colors.grey.shade300,
                    height: 60,
                  ),
                  SizedBox(
                    height: 420,
                    width: width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          height: 400,
                          width: width < 1400 ? 1500 : width,
                          child: SingleChildScrollView(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Table(
                                        columnWidths: const {
                                          0: FixedColumnWidth(140),
                                          1: FixedColumnWidth(650),
                                        },
                                        children: [
                                          TableRow(children: [
                                            Text("",
                                                style: mediumBlackTextStyle
                                                    .copyWith(
                                                        fontSize: 16,
                                                        color: notifire
                                                            .getMainText)),
                                            Text("Pzn",
                                                style: mediumBlackTextStyle
                                                    .copyWith(
                                                        fontSize: 16,
                                                        color: notifire
                                                            .getMainText)),
                                            Text("Hilfsmittelnummer",
                                                style: mediumBlackTextStyle
                                                    .copyWith(
                                                        fontSize: 16,
                                                        color: notifire
                                                            .getMainText)),
                                            Text("Lex",
                                                style: mediumBlackTextStyle
                                                    .copyWith(
                                                        fontSize: 16,
                                                        color: notifire
                                                            .getMainText)),
                                            Text("Netto",
                                                style: mediumBlackTextStyle
                                                    .copyWith(
                                                        fontSize: 16,
                                                        color: notifire
                                                            .getMainText)),
                                            Text("Brutto",
                                                style: mediumBlackTextStyle
                                                    .copyWith(
                                                        fontSize: 16,
                                                        color: notifire
                                                            .getMainText)),
                                          ]),
                                          const TableRow(children: [
                                            SizedBox(
                                              height: 12,
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                          ]),
                                          newRow12(
                                              title: "Nick Pro",
                                              subtitle: "\$10,000",
                                              lefttorepay: "40",
                                              duration: "\$150",
                                              intrestrate: "12%",
                                              installment: "\$2932 / month",
                                              isgreen: true),
                                          newRow12(
                                              title: "Macbook",
                                              subtitle: "\$29,000",
                                              lefttorepay: "29",
                                              duration: "\$290",
                                              intrestrate: "5%",
                                              installment: "\$2957 / month",
                                              isgreen: true),
                                          newRow12(
                                              title: "Iphone 14",
                                              subtitle: "\$55,460",
                                              lefttorepay: "21",
                                              duration: "\$950",
                                              intrestrate: "15%",
                                              installment: "\$5671 / month",
                                              isgreen: false),
                                          newRow12(
                                              title: "Instagram",
                                              subtitle: "\$35,256",
                                              lefttorepay: "55",
                                              duration: "\$295",
                                              intrestrate: "4%",
                                              installment: "\$3245 / month",
                                              isgreen: true),
                                          newRow12(
                                              title: "FaceBook",
                                              subtitle: "\$12,346",
                                              lefttorepay: "30",
                                              duration: "\$999",
                                              intrestrate: "20%",
                                              installment: "\$7145 / month",
                                              isgreen: false),
                                          newRow12(
                                              title: "Oppo",
                                              subtitle: "\$11,265",
                                              lefttorepay: "25",
                                              duration: "\$959",
                                              intrestrate: "10%",
                                              installment: "\$1111 / month",
                                              isgreen: true),
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
            ),
          )),
    );
  }

  TableRow newRow12(
      {required String title,
      required String subtitle,
      required String lefttorepay,
      required String duration,
      required String intrestrate,
      required String installment,
      required bool isgreen}) {
    return TableRow(children: [
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            CircleAvatar(
                backgroundImage: AssetImage("assets/avatar.png"),
                backgroundColor: Colors.transparent),
            Positioned(
                left: 20,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/avatar1.png"),
                  backgroundColor: Colors.transparent,
                )),
            Positioned(
                left: 40,
                child: CircleAvatar(
                    backgroundImage: AssetImage("assets/avatar2.png"),
                    backgroundColor: Colors.transparent)),
          ],
        ),
      ),
      ListTile(
        dense: true,
        contentPadding: const EdgeInsets.all(0),
        title: Text(
          title,
          style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            subtitle,
            style: mediumGreyTextStyle,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(lefttorepay,
            style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),
            overflow: TextOverflow.ellipsis,
            maxLines: 1),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(duration,
            style: mediumBlackTextStyle.copyWith(color: notifire.getMainText),
            overflow: TextOverflow.ellipsis,
            maxLines: 1),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            SvgPicture.asset("assets/check.svg",
                height: 12,
                width: 12,
                color: isgreen ? Colors.green : Colors.red),
            const SizedBox(
              width: 8,
            ),
            Text(isgreen ? "active" : " Inactive",
                style: mediumBlackTextStyle.copyWith(
                    color:
                        isgreen ? Colors.green.shade600 : Colors.red.shade600),
                overflow: TextOverflow.ellipsis,
                maxLines: 1),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            const Icon(Icons.edit, color: appGreyColor),
            const SizedBox(
              width: 4,
            ),
            Text("Edite",
                style: mediumBlackTextStyle.copyWith(color: appGreyColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 1),
            const SizedBox(
              width: 10,
            ),
            const Icon(Icons.delete, color: Colors.red),
            const SizedBox(
              width: 4,
            ),
            Text("Delete",
                style: mediumBlackTextStyle.copyWith(color: Colors.red),
                overflow: TextOverflow.ellipsis,
                maxLines: 1),
          ],
        ),
      ),
    ]);
  }
}
