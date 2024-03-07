// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:buzz/api/rest/api.dart';
import 'package:buzz/appstaticdata/staticdata.dart';
import 'package:buzz/model/jens/AiRecommondation.dart';
import 'package:buzz/model/lightabrechnungsrequest.dart';
import 'package:buzz/provider/proviercolors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../model/jens/RecommendationRequest.dart';
import 'comunwidget4.dart';

class OpdataChallengeScreen extends StatefulWidget {
  const OpdataChallengeScreen({Key? key}) : super(key: key);

  @override
  State<OpdataChallengeScreen> createState() => _OpdataChallengeScreenState();
}

class _OpdataChallengeScreenState extends State<OpdataChallengeScreen>
    with TickerProviderStateMixin {
  ColorNotifire notifire = ColorNotifire();

  late LightAbrechnungsrequest _lightAbrechnungsrequest;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey _scrollToKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;

  final TextEditingController _ikController = TextEditingController();
  final TextEditingController _icdkController = TextEditingController();
  final TextEditingController _diagnoseController = TextEditingController();

  bool correctCodeEntered = false;

  bool _processingRequest = false;
  bool _processingFinished = false;
  bool _hitSubmit = false;
  double _width = 0;
  bool _isFirstTime = true;
  bool _noResults = false;

  bool _icd10CodeIsBeingTranslated = false;

  String _krankenkassenIk = "";
  String _icd10Code = "";
  String _diagnose = "";
  String _bundesland = "";

  List<AiRecommondation> _aiRecommondations = [];

  Widget _buildCodeInputWidget() {
    TextEditingController _codeController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            // Add your gradient or image background here
            ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.network(
                  "https://upload.wikimedia.org/wikipedia/commons/5/5b/Opta_Data_Gruppe_logo_(2021).svg",
                  height: 90,
                  width: 90,
                ),
              ],
            ),
            const Text(
              'Gib den Zugangscode ein',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
                width: 240,
                child: TextField(
                  controller: _codeController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    hintText: 'Code',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),

                    // Add more decoration properties as needed
                  ),
                  // Add input validation and formatting as needed
                )),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement your code submission logic
                String realCode = "6341";
                if (_codeController.text == realCode) {
                  setState(() {
                    correctCodeEntered = true;
                  });
                }
              },
              child: const Text('Code prüfen'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                // Add more styling as needed
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _lightAbrechnungsrequest = _makeStartSetting();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
    if (!correctCodeEntered) {
      return _buildCodeInputWidget();
    }

    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: LayoutBuilder(
          builder: (context, constraints) {
            _width = constraints.maxWidth;
            bool isMobile = constraints.maxWidth < 700;
            return Form(
              key: _formKey,
              // Ein GlobalKey<FormState>, um das Formular später zu validieren
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // optdadata logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.network(
                        "https://upload.wikimedia.org/wikipedia/commons/5/5b/Opta_Data_Gruppe_logo_(2021).svg",
                        height: isMobile ? 90 : 150,
                        width: isMobile ? 90 : 150,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hilfsmittel Recommender",
                        style: TextStyle(
                            fontFamily: "Gilroy",
                            color: notifire.getbacktextcolors,
                            fontWeight: FontWeight.w900,
                            fontSize: isMobile ? 16 : 22),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: isMobile ? 300 : 600,
                          child: Text(
                              "Dies ist eine stark-reduzierte Demo-Version. Der volle Software-Umfang (UI sowie Modell-Umfang) kann auf Wunsch umgesetzt werden. Bitte kontaktieren Sie hierzu jens.hauser@hotmail.de. Vielen Dank!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Gilroy",
                                color: Colors.black.withOpacity(0.9),
                                fontSize: isMobile ? 12 : 14,
                              ))),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(padding),
                    child: Container(
                        decoration: BoxDecoration(
                          color: notifire.getcontiner,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:
                            buildContent(isMobile, size: constraints.maxWidth)),
                  ),
                ],
              ),
            );
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

  void _exexute_demo(
      String krankenkassenIk, String bundesland, String icd10Code) async {
    setState(() {
      _krankenkassenIk = "";
      _bundesland = "";
      _icd10Code = "";
      _diagnose = "";
      _icdkController.text = "";
      _ikController.text = "";
      _diagnoseController.text = "";
      _aiRecommondations = [];
      _isFirstTime = true;
    });

    String ik = krankenkassenIk;
    String ikBuilder = "";
    Duration delay = const Duration(milliseconds: 210);
    for (int i = 0; i < ik.length; i++) {
      ikBuilder += ik[i].toString();
      setState(() {
        _krankenkassenIk = ikBuilder;
        _ikController.text = ikBuilder;
      });
      await Future.delayed(delay);
    }

    await Future.delayed(delay);
    await Future.delayed(delay);
    await Future.delayed(delay);
    await Future.delayed(delay);
    await Future.delayed(delay);

    setState(() {
      _bundesland = bundesland;
    });

    RenderBox renderBox;
    Offset position;
    RenderBox scrollBox;
    double offset;
    renderBox = _scrollToKey.currentContext?.findRenderObject() as RenderBox;
    position = renderBox.localToGlobal(Offset.zero);
    scrollBox = Scrollable.of(_scrollToKey.currentContext!)
        .context
        .findRenderObject() as RenderBox;
    offset =
        position.dy - (scrollBox.size.height / 2 - renderBox.size.height / 2);
    _scrollController.animateTo(
      // sroll to _scrollToKey
      offset,

      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
    );

    await Future.delayed(delay);
    await Future.delayed(delay);
    await Future.delayed(delay);

    String icdCode = icd10Code;
    String icdCodeBuilder = "";
    for (int i = 0; i < icdCode.length; i++) {
      await Future.delayed(delay);
      await Future.delayed(delay);
      await Future.delayed(delay);
      icdCodeBuilder += icdCode[i].toString();
      setState(() {
        _icd10Code = icdCodeBuilder;
        _icdkController.text = icdCodeBuilder;
      });
    }
    _loadNewResultsIfPossible();
  }

  Widget _demoButton(bool isMobile, String demoName, String ik,
      String bundesland, String icd10) {
    return InkWell(
        onTap: () async {
          _exexute_demo(ik, bundesland, icd10);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "auto-generate-svgrepo-com.svg",
              height: isMobile ? 16 : 24,
              width: isMobile ? 16 : 24,
              color: notifire.getsubcolors,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              demoName,
              style: TextStyle(
                  // hand written styl
                  fontFamily: "Gilroy",
                  color: isMobile ? Colors.black : notifire.getsubcolors,
                  fontSize: isMobile ? 12 : 14,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ));
  }

  Widget buildContent(bool isMobile, {required double size}) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _demoButton(isMobile, "Inkontinenz Case 1", "109519005",
                "Brandenburg", "R32"),
            const SizedBox(
              height: 5,
            ),
            _demoButton(
                isMobile, "Inkontinenz Case 2", "105313145", "Hessen", "R32"),
            const SizedBox(
              height: 5,
            ),
            _demoButton(
                isMobile, "Hörverlust Case 1", "108310400", "Bayern", "H90.3"),
            const SizedBox(
              height: 5,
            ),
            _demoButton(
                isMobile, "Hörverlust Case 2", "104940005", "Bayern", "H90.5"),
            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 23, left: 20, right: 20),
                    child: SizedBox(
                        width: 300,
                        child: TextFormField(
                            controller: _ikController,
                            onChanged: (value) {
                              setState(() {
                                _krankenkassenIk = value;
                              });
                              _loadNewResultsIfPossible();
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
                              labelText: 'Krankenkassen-IK',
                              labelStyle: mediumGreyTextStyle,
                            ))),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // center text
            SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(top: 23, left: 20, right: 20),
                  child: DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      // Add Horizontal padding using menuItemStyleData.padding so it matches
                      // the menu padding when button's width is not specified.
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      // Add more decoration..
                    ),
                    hint: Text(
                      'Bundesland',
                      maxLines: 1,
                      style: mediumGreyTextStyle,
                    ),
                    items: [
                      'Brandenburg',
                      'Rheinland',
                      'Hessen',
                      'Niedersachsen',
                      'Berlin',
                      'Baden-Württemberg',
                      'Bayern',
                      'Westfalen-Lippe',
                      'Sachsen-Anhalt',
                      'Sachsen',
                      'Mecklenburg-Vorpommern',
                      'Schleswig-Holstein',
                      'Rheinland-Pfalz',
                      'Thüringen',
                      'Hamburg',
                      'Saarland',
                      'Bremen'
                    ]
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _bundesland = value.toString();
                      });
                      _loadNewResultsIfPossible();
                    },
                    onSaved: (value) {
                      setState(() {
                        _bundesland = value.toString();
                      });
                      _loadNewResultsIfPossible();
                    },
                    value: _bundesland.isNotEmpty ? _bundesland : null,
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: notifire.getbacktextcolors,
                      ),
                      iconSize: 24,
                    ),
                    style: mediumBlackTextStyle.copyWith(
                        color: notifire.getMainText),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        color: notifire.getcontiner,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                )),

            const SizedBox(
              height: 30,
            ),

            Row(
              // space items evenly
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_krankenkassenIk.length > 5)
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 23, left: 20, right: 20),
                      child: SizedBox(
                          width: 300,
                          child: TextFormField(
                              controller: _icdkController,
                              onChanged: (value) {
                                setState(() {
                                  _icd10Code = value;
                                });
                                _loadNewResultsIfPossible();
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
                                labelText: 'ICD-10 Code',
                                labelStyle: mediumGreyTextStyle,
                              ))),
                    ),
                  ),
                if (_krankenkassenIk.length > 5 && !isMobile)
                  Row(children: [
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 23, left: 20, right: 20),
                        child: SizedBox(
                            width: 300,
                            child: TextFormField(
                                controller: _diagnoseController,
                                onChanged: (value) {
                                  setState(() {
                                    _diagnose = value;
                                  });
                                  _loadNewResultsIfPossible();
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
                                  labelText: 'Diagnose',
                                  labelStyle: mediumGreyTextStyle,
                                ))),
                      ),
                    ),
                    if (_diagnose.isNotEmpty)
                      Column(children: [
                        SizedBox(height: 20,),
                      InkWell(
                          onTap: _requestIcd10CodeTranslation,
                          child: Lottie.asset('assets/translate.json',
                              height: 50, width: 50))]),
                  ]),
              ],
            ),
            if (_krankenkassenIk.length > 5 && isMobile)
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(top: 23, left: 20, right: 20),
                  child: SizedBox(
                      width: 300,
                      child: TextFormField(
                          controller: _diagnoseController,
                          onChanged: (value) {
                            setState(() {
                              _diagnose = value;
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
                            labelText: 'Diagnose',
                            labelStyle: mediumGreyTextStyle,
                          ))),
                ),
              ),
            if (_krankenkassenIk.length > 5)
              const SizedBox(
                height: 20,
              ),
            if (_krankenkassenIk.length > 5)
              Text(
                textAlign: TextAlign.center,
                "ICD-10 Code oder Diagnose eingeben. \nJe mehr Rezeptdaten eingegeben werden,${isMobile ? "\n" : " "}desto besser werden die Vorschläge.",
                style: TextStyle(
                    // center text
                    color: notifire.getsubcolors,
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis),
              ),
            if (_krankenkassenIk.length > 5)
              SizedBox(
                key: _scrollToKey,
                height: 40,
              ),
            if (_aiRecommondations.isNotEmpty && _krankenkassenIk.length > 5)
              ComunWidget4(
                percentage:
                    _aiRecommondations.first.hilfsmittelNummer!.percentage! /
                        100.0,
                big: true,
              ),
            if (_krankenkassenIk.length > 5 &&
                !_processingFinished &&
                _icd10Code.isNotEmpty)
              Lottie.asset('assets/ai.json',
                  height: isMobile ? 200 : 250, width: isMobile ? 200 : 250),
            if (_krankenkassenIk.length > 5 &&
                _processingFinished &&
                _noResults)
              Lottie.asset('assets/no_results.json',
                  height: isMobile ? 200 : 250, width: isMobile ? 200 : 250),
            if (_krankenkassenIk.length > 5 &&
                _processingFinished &&
                _noResults)
              SizedBox(
                  width: isMobile ? 250 : 500,
                  child: Text(
                    "Leider hat Deine Auswahl zu keinem Ergebnis geführt. Bitte beachte: Unser Modell wurde auf einer validen Vorauswahl von Kassen und Erkrankungen vortrainiert und kann zur Zeit nur in diesem Rahmen Recommendations ausgeben. Ausbaustufen des Modells werden Deine Eingaben als neue Lerninhalte (bspw. neue Erkrankungen) berücksichtigen. Versuche es gerne erneuert mit anderen Daten (bspw. mit einer Inko-Versorgung) oder klicke einen unserer Testcases, um Recommendations mit echten Testdaten zu sehen.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        // center text
                        color: notifire.getsubcolors,
                        fontSize: 14),
                  )),

            if (_krankenkassenIk.length > 5)
              const SizedBox(
                height: 40,
              ),

            if (_krankenkassenIk.length > 5 && _aiRecommondations.isNotEmpty)
              SizedBox(
                height: isMobile ? 5000 : 1900,
                width: isMobile
                    ? MediaQuery.of(context).size.width - 20
                    : MediaQuery.of(context).size.width - 200,
                child: DraggableGridViewBuilder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 1 : 3,
                    childAspectRatio: 2.3,
                  ),
                  dragCompletion: (List<DraggableGridItem> list,
                      int beforeIndex, int afterIndex) {
                    AiRecommondation aiRecommondation =
                        _aiRecommondations[beforeIndex];
                    AiRecommondation aiRecommondation2 =
                        _aiRecommondations[afterIndex];
                    setState(() {
                      _aiRecommondations[beforeIndex] = aiRecommondation2;
                      _aiRecommondations[afterIndex] = aiRecommondation;
                    });
                    _showAiTrainedMessage();
                  },
                  dragChildWhenDragging:
                      (List<DraggableGridItem> list, int index) {
                    return PlaceHolderWidget(
                      child: Opacity(
                          opacity: 0.3,
                          child: _buildAiRecommondationCard(
                              _aiRecommondations[index], isMobile, 33)),
                    );
                  },
                  dragFeedback: (List<DraggableGridItem> list, int index) {
                    return PlaceHolderWidget(
                      child: _buildAiRecommondationCard(
                          _aiRecommondations[index], isMobile, 33),
                    );
                  },
                  isOnlyLongPress: isMobile,
                  dragPlaceHolder: (List<DraggableGridItem> list, int index) {
                    return const PlaceHolderWidget(
                        // opacity 0.3 card
                        child: SizedBox(
                      height: 360,
                    ));
                  },
                  children: _aiRecommondations
                      .map((e) => DraggableGridItem(
                          isDraggable: true,
                          child: _buildAiRecommondationCard(e, isMobile, 2)))
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showAiTrainedMessage() {
    SnackBar snackBar = SnackBar(
      width: 360,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      showCloseIcon: true,
      closeIconColor: Colors.white,
      animation: Tween<double>(begin: 0, end: 300)
          .animate(AnimationController(vsync: this)),
      content: const Text(
        "Deine Rückmeldungen hat zur Verbesserung des Modells beigetragen.",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      backgroundColor: Colors.lightGreen,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    Timer(const Duration(seconds: 4), () {
      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    });
  }

  void _requestIcd10CodeTranslation() {
    if (_icd10CodeIsBeingTranslated) {
      return;
    }
    _icd10CodeIsBeingTranslated = true;

    setState(() {
      _icd10Code = "";
      _icdkController.text = "";
    });

    JensApi().icd10CodeTranslation(diagnose: _diagnose).then((value) {
      setState(() {
        _icd10Code = value;
        _icdkController.text = value;
        _icd10CodeIsBeingTranslated = false;
      });
      _loadNewResultsIfPossible();
    }).catchError((e) {
      print(e);
      _icd10CodeIsBeingTranslated = false;
    });
  }

  Widget _buildAiRecommondationCard(
      AiRecommondation aiRecommondation, bool isMobile, int index) {
    List<Widget> prices = [];
    for (var price in aiRecommondation.prices!) {
      prices.add(Text(
        "${price.value!}€   (${price.percentage}%)",
        style: mediumGreyTextStyle.copyWith(fontSize: 14),
      ));
    }

    Widget row = Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  aiRecommondation.hilfsmittelNummer!.value!,
                  style: mainTextStyle.copyWith(
                      fontSize: isMobile ? 14 : 17,
                      color: notifire!.getMainText),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: prices,
                ),
                const SizedBox(height: 4),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: ComunWidget4(
            percentage: aiRecommondation.hilfsmittelNummer!.percentage! / 100.0,
            noAnimation: index == 33 ? true : false,
          ),
        )
      ],
    );

    Widget content = row;

    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 120,
        width: 375,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
          boxShadow: boxShadow,
        ),
        child: content,
      ),
    );
  }

  void _loadNewResultsIfPossible() {
    if (_krankenkassenIk.isNotEmpty &&
        _krankenkassenIk.length > 8 &&
        _bundesland.isNotEmpty &&
        ((_icd10Code.isNotEmpty && _icd10Code.length >= 2) ||
            _diagnose.isNotEmpty && _icd10Code.length > 5)) {
      _loadNewResults();
    }
  }

  void _loadNewResults() {
    if (_processingRequest) {
      print(
          "Not loading new results, because a request is already in progress.");
      return;
    }
    setState(() {
      _processingRequest = true;
      _processingFinished = false;
      _noResults = false;
    });

    RenderBox renderBox;
    Offset position;
    RenderBox scrollBox;
    double offset;

    RecommendationRequest recommendationRequest = RecommendationRequest();
    recommendationRequest.krankenkassenIk = _krankenkassenIk;
    recommendationRequest.diagnoseText = _diagnose;
    recommendationRequest.icd10Code = _icd10Code;
    recommendationRequest.bundesLand = _bundesland;

    try {
      JensApi()
          .requestAiSuggestions(recommendationRequest: recommendationRequest)
          .catchError((e) {
        print(e);
        setState(() {
          _processingRequest = false;
        });
      }).then((value) => {
                setState(() {
                  _aiRecommondations = value;
                  _processingRequest = false;
                  _processingFinished = true;

                  if (_aiRecommondations.isEmpty) {
                    _noResults = true;
                  }
                }),
                renderBox = _scrollToKey.currentContext?.findRenderObject()
                    as RenderBox,
                position = renderBox.localToGlobal(Offset.zero),
                scrollBox = Scrollable.of(_scrollToKey.currentContext!)!
                    .context
                    .findRenderObject() as RenderBox,
                offset = position.dy -
                    (scrollBox.size.height / 2 - renderBox.size.height / 2),
                setState(() {
                  _isFirstTime = false;
                }),
              });
    } catch (e) {
      print("Fehler bei der abfrage d");
      print(e);
    }
  }
}
