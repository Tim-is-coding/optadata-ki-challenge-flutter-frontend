import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/sizebox.dart';
import '../Widgets/textfilde.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';
import '../provider/proviercolors.dart';

class ValiDationFormPage extends StatefulWidget {
  const ValiDationFormPage({Key? key}) : super(key: key);

  @override
  State<ValiDationFormPage> createState() => _ValiDationFormPageState();
}

class _ValiDationFormPageState extends State<ValiDationFormPage> {
  bool subvalue = false;
  double incrimantsize = 0.0;
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    controller7.dispose();
    controller8.dispose();
    controller9.dispose();
    controller10.dispose();
    controller11.dispose();
    controller12.dispose();
  }

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
                      const ComunTitle(title: 'Validation Form', path: "Forms"),

                      _buildform(size: 1035), //1128

                      const SizeBoxx(),
                      const ComunBottomBar(),
                    ],
                  ),
                ),
              );
            } else if (constraints.maxWidth < 1200) {
              return SizedBox(
                height: 1000,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Validation Form', path: "Forms"),

                      _buildform(size: 1030), //1120
                      const SizeBoxx(),
                      const ComunBottomBar(),
                    ],
                  ),
                ),
              );
            } else {
              // Website layout
              return SizedBox(
                height: 1000,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'Validation Form', path: "Forms"),

                      _buildform(size: 1010), //1120
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

  String? selectedOption1;

  List<String> dropdownOptions1 = [
    "Selects Menu 1",
    "Selects Menu 2",
    "Selects Menu 3"
  ];

  Widget dropdownbuton({TextStyle? stle}) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text('Best Skill', style: TextStyle(color: notifire!.getsubcolors)),
          const SizedBox(
            height: 10,
          ),
          DropdownButtonFormField<String>(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Select Options';
              }
              return null;
            },
            dropdownColor: notifire!.getcontiner,
            value: selectedOption1,
            style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),
            padding: const EdgeInsets.all(0),
            items: dropdownOptions1.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option, style: mediumGreyTextStyle),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedOption1 = newValue;
              });
            },
            decoration: InputDecoration(
              hintText: 'Open this select menu',
              hintStyle: TextStyle(color: notifire!.getsubcolors, overflow: TextOverflow.ellipsis),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  final _formKey1 = GlobalKey<FormState>();

  Widget _buildform({required double size}) {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        // height: size+incrimantsize,
        //   width: 900,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire!.getcontiner,
          boxShadow: boxShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Basic Validation",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: notifire!.getMainText),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      height: 60,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ComunTextField(
                                title: "First name",
                                hinttext: 'Mark',
                                controller: controller)),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: dropdownbuton(),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ComunTextField(
                                title: "Email",
                                hinttext: 'Enter Email',
                                controller: controller1)),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: ComunTextField(
                                title: "Currency",
                                hinttext: 'Enter Currency',
                                controller: controller2)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ComunTextField(
                                title: "Password",
                                hinttext: 'Enter Password',
                                controller: controller3)),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: ComunTextField(
                                title: "Website",
                                hinttext: 'http://example.com',
                                controller: controller4)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(child: _buildcomuntextfild(titile: 'City')),
                    //     const SizedBox(width: 12,),
                    //     Expanded(child: _buildcomuntextfild(titile: 'Zip')),
                    //   ],
                    // ),
                    // _buildpaymentMethod(),
                    // const SizedBox(height: 15,),
                    // _builddropdown(),
                    // const SizedBox(height: 15,),
                    // _buildfilechoose(),
                    // const SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(
                            child: _buildEntersomedetil(
                                title: "Description",
                                hinttext: 'Enter Your Comment')),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: ComunTextField(
                                title: "Phone(US)",
                                hinttext: '91+',
                                controller: controller5)),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: ComunTextField(
                                title: "Digits",
                                hinttext: 'Enter Digits',
                                controller: controller6)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: ComunTextField(
                                title: "Number ",
                                hinttext: 'Enter Number',
                                controller: controller7)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: ComunTextField(
                                title: "Range[1.5]",
                                hinttext: 'Enter Range',
                                controller: controller8)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            activeColor: Colors.green,
                            side: const BorderSide(color: Color(0xfffc483c)),
                            contentPadding: const EdgeInsets.all(0),
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text('Agree to terms and conditions',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: subvalue
                                        ? Colors.green
                                        : const Color(0xfffc483c))),
                            value: subvalue,
                            onChanged: (bool? value) {
                              setState(() {
                                subvalue = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(flex: 1, child: Container()),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {}
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff7366ff),
                                      fixedSize: const Size(120, 38)),
                                  child: const Text(
                                    "Submit Form",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w200),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),

              Form(
                key: _formKey1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vertical Forms With Icon",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: notifire!.getMainText),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      height: 60,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: mediumBlackTextStyle.copyWith(
                              color: notifire!.getMainText),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: TextFormField(
                            style: TextStyle(color: notifire!.getMainText),
                            enabled: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintStyle:
                                  mediumGreyTextStyle.copyWith(fontSize: 13),
                              hintText: 'Username',
                              prefixIcon: Image(
                                  image: const AssetImage('assets/user123.png'),
                                  color: notifire!.getMainText),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.3)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              // contentPadding: widget.prefix!=null?  EdgeInsets.symmetric(vertical: 10,horizontal: 10):EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: mediumBlackTextStyle.copyWith(
                              color: notifire!.getMainText),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: TextFormField(
                            style: TextStyle(color: notifire!.getMainText),
                            enabled: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintStyle:
                                  mediumGreyTextStyle.copyWith(fontSize: 13),
                              hintText: 'Enter a Password',
                              prefixIcon: Image(
                                  image:
                                      const AssetImage('assets/unlocklac.png'),
                                  color: notifire!.getMainText),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.3)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              // contentPadding: widget.prefix!=null?  EdgeInsets.symmetric(vertical: 10,horizontal: 10):EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(child: ComunTextField(title: "Password", hinttext: 'Enter a Password', controller: controller,prefix: Image.asset('assets/unlocklac.png',color: notifire!.getMainText), )),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            activeColor: Colors.green,
                            side: const BorderSide(color: Color(0xfffc483c)),
                            contentPadding: const EdgeInsets.all(0),
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text('Check Me out',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: subvalue
                                        ? Colors.green
                                        : const Color(0xfffc483c))),
                            value: subvalue,
                            onChanged: (bool? value) {
                              setState(() {
                                subvalue = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey1.currentState!.validate()) {}
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff7366ff),
                                fixedSize: const Size(120, 38)),
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200),
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              // if (_formKey.currentState!.validate()) {
                              // }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                fixedSize: const Size(120, 38)),
                            child: const Text(
                              "Cancle",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200),
                            )),
                      ],
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

  String? selectedOption2;
  String? selectedOption;
  List<String> dropdownOptions2 = ['India', 'Uk', 'Thailand', 'Newyourk'];
  List<String> dropdownOptions = ['Buzz', 'Buz11', '0.2Buzz'];



  Widget _buildEntersomedetil(
      {required String hinttext, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: mediumGreyTextStyle.copyWith(color: notifire!.getMainText),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 80,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: TextField(
              style: TextStyle(color: notifire!.getMainText),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  hintText: hinttext,
                  border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }

  selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['png', 'jpg', 'jpeg']);

    if (file != null) {
      setState(() {});
    }
  }

  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  TextEditingController controller8 = TextEditingController();
  TextEditingController controller9 = TextEditingController();
  TextEditingController controller10 = TextEditingController();
  TextEditingController controller11 = TextEditingController();
  TextEditingController controller12 = TextEditingController();
}

enum SingingCharacter { materCard, visa }

