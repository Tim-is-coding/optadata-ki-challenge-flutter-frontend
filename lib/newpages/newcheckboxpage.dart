// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/sizebox.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';
import '../provider/proviercolors.dart';

class NewCheckboxRadioPage extends StatefulWidget {
  const NewCheckboxRadioPage({Key? key}) : super(key: key);

  @override
  State<NewCheckboxRadioPage> createState() => _NewCheckboxRadioPageState();
}

class _NewCheckboxRadioPageState extends State<NewCheckboxRadioPage> {
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
                      const ComunTitle(
                          title: 'Checkbox & Radio', path: "Forms"),
                      _buildcheckbox(size: 380, width: constraints.maxWidth),
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
                      const ComunTitle(
                          title: 'Checkbox & Radio', path: "Forms"),
                      _buildcheckbox(size: 50, width: constraints.maxWidth),
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
                      const ComunTitle(
                          title: 'Checkbox & Radio', path: "Forms"),
                      _buildcheckbox(size: 0, width: constraints.maxWidth),
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

  bool _value = false;
  bool _value1 = true;
  bool _value2 = false;
  bool _value3 = false;

  Widget _buildcheckbox({required double size, required double width}) {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        // height: 465+size,
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
              Text(
                "Default checkbox",
                style: mainTextStyle.copyWith(
                    fontSize: 22, color: notifire!.getMainText),
              ),
              Divider(
                color: Colors.grey.shade300,
                height: 60,
              ),
              width < 600
                  ? Column(
                children: [
                  _buildDefault(),
                  _buildDisabled(),
                  _buildRightChecks(),
                  _buildIndeterminate(),
                  _buildcheckboxDefault(),
                  _buildcheckboxrounded(),
                  _buildcheckboxoutline(),
                  _buildoutlinecheckboxrounded(),
                  _buildradioDefault(),
                  _buildradioSquareDefault(),
                  _buildoutlineradioDefault(),
                  _buildoutlineradioSquareDefault()
                ],
              )
                  : width < 1000
                  ? Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildDefault(),
                      ),
                      Expanded(
                        child: _buildDisabled(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildRightChecks(),
                      ),
                      Expanded(
                        child: _buildIndeterminate(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildcheckboxDefault(),
                      ),
                      Expanded(child: _buildcheckboxrounded()),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildcheckboxoutline()),
                      Expanded(child: _buildoutlinecheckboxrounded())
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildradioDefault()),
                      Expanded(child: _buildradioSquareDefault()),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildoutlineradioDefault()),
                      Expanded(
                          child: _buildoutlineradioSquareDefault()),
                    ],
                  )
                ],
              )
                  : Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildDefault(),
                      ),
                      Expanded(
                        child: _buildDisabled(),
                      ),
                      Expanded(
                        child: _buildRightChecks(),
                      ),
                    ],
                  ),
                  _buildIndeterminate(),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _buildcheckboxDefault()),
                          Expanded(child: _buildcheckboxrounded()),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _buildcheckboxoutline()),
                          Expanded(
                              child: _buildoutlinecheckboxrounded()),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _buildradioDefault()),
                          Expanded(child: _buildradioSquareDefault()),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: _buildoutlineradioDefault()),
                          Expanded(
                              child:
                              _buildoutlineradioSquareDefault()),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDefault() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Default Checks",
                style: mediumBlackTextStyle.copyWith(
                    fontSize: 17, color: notifire!.getMainText),
              ),
              const SizedBox(
                height: 15,
              ),
              CheckboxListTile(
                title: Text('Default checkbox',
                    style:
                    TextStyle(fontSize: 14, color: notifire!.getMainText)),
                activeColor: appMainColor,
                contentPadding: const EdgeInsets.all(0),
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return appMainColor;
                  }
                  return notifire?.getmaintext;
                }),
                selected: _value,
                dense: true,
                value: _value,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  setState(() {
                    _value = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Checked checkbox',
                    style: TextStyle(
                      fontSize: 14,
                    )),
                activeColor: appMainColor,
                contentPadding: const EdgeInsets.all(0),
                checkColor: Colors.white,
                selected: _value1,
                dense: true,
                value: _value1,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  setState(() {
                    _value1 = value!;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDisabled() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Disabled Checks",
                style: mediumBlackTextStyle.copyWith(
                    fontSize: 17, color: notifire!.getMainText),
              ),
              const SizedBox(
                height: 15,
              ),
              CheckboxListTile(
                title: Text('Disabled checkbox', style: mediumGreyTextStyle),
                activeColor: appMainColor.withOpacity(0.7),
                contentPadding: const EdgeInsets.all(0),
                checkColor: Colors.white60,
                selected: false,
                dense: true,
                value: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {},
              ),
              CheckboxListTile(
                title: Text('Disabled checked ', style: mediumGreyTextStyle),
                activeColor: appMainColor,
                contentPadding: const EdgeInsets.all(0),
                checkColor: Colors.white,
                selected: true,
                dense: true,
                value: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRightChecks() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [SizedBox()],
              ),
              Text(
                "Right Checks",
                style: mediumBlackTextStyle.copyWith(
                    fontSize: 17, color: notifire!.getMainText),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 180,
                child: CheckboxListTile(
                  title: Text('Reverse checkbox',
                      style: TextStyle(
                          fontSize: 14, color: notifire!.getMainText)),
                  activeColor: appMainColor,
                  contentPadding: const EdgeInsets.all(0),
                  checkColor: Colors.white60,
                  fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return appMainColor;
                    }
                    return notifire?.getmaintext;
                  }),
                  selected: _value2,
                  dense: true,
                  value: _value2,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  onChanged: (bool? value) {
                    setState(() {
                      _value2 = value!;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 180,
                child: CheckboxListTile(
                  title: Text('Disabled reverse checkbox',
                      style: mediumGreyTextStyle),
                  activeColor: appMainColor,
                  contentPadding: const EdgeInsets.all(0),
                  checkColor: Colors.white,
                  selected: true,
                  dense: true,
                  value: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  onChanged: (bool? value) {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndeterminate() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Indeterminate",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: notifire!.getMainText),
              ),
              const SizedBox(
                height: 15,
              ),
              CheckboxListTile(
                title: Text('Indeterminate checkbox',
                    style: TextStyle(fontSize: 14,color: notifire?.getMainText)),
                activeColor: appMainColor,
                contentPadding: const EdgeInsets.all(0),
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return appMainColor;
                  }
                  return notifire?.getmaintext;
                }),
                selected: _value3,
                dense: true,
                value: _value3,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  setState(() {
                    _value3 = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  var seletCheck = [];
  List name = [
    'Primary',
    'Purple',
    'Success',
    'Waring',
    'Danger',
    'Black',
    'Muted',
  ];
  List<Color> color = [
    Colors.blueAccent,
    Colors.purple,
    Colors.green,
    Colors.red,
    Colors.amber,
    Colors.black,
    Colors.deepPurple
  ];

  Widget _buildcheckboxDefault() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Checkbox Default",
                style: mediumBlackTextStyle.copyWith(
                    fontSize: 17, color: notifire!.getMainText),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      title: Text(name[index],
                          style: TextStyle(
                              fontSize: 14, color: notifire!.getMainText)),
                      activeColor: color[index],
                      contentPadding: const EdgeInsets.all(0),
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return color[index];
                        }
                        return notifire?.getmaintext;
                      }),
                      // selected: _value4,
                      dense: true,
                      value: seletCheck.contains(index) ? true : false,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool? value) {
                        if (seletCheck.contains(index)) {
                          setState(() {
                            seletCheck.remove(index);
                          });
                        } else {
                          setState(() {
                            seletCheck.add(index);
                          });
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var selectrad = [];

  Widget _buildcheckboxrounded() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Checkbox Rounded",
                style: mediumBlackTextStyle.copyWith(
                    fontSize: 17, color: notifire!.getMainText),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    final theme = Theme.of(context);
                    final oldCheckboxTheme = theme.checkboxTheme;

                    final newCheckBoxTheme = oldCheckboxTheme.copyWith(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                    );
                    return Theme(
                      data: theme.copyWith(checkboxTheme: newCheckBoxTheme),
                      child: CheckboxListTile(
                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        title: Text(name[index],
                            style: TextStyle(
                                fontSize: 14, color: notifire!.getMainText)),
                        activeColor: color[index],
                        contentPadding: const EdgeInsets.all(5),
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return color[index];
                          }
                          return notifire?.getmaintext;
                        }),
                        // selected: _value4,
                        dense: true,
                        value: selectrad.contains(index) ? true : false,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool? value) {
                          if (selectrad.contains(index)) {
                            setState(() {
                              selectrad.remove(index);
                            });
                          } else {
                            setState(() {
                              selectrad.add(index);
                            });
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var select1 = [];

  Widget _buildcheckboxoutline() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Checkbox Outline",
                style: mediumBlackTextStyle.copyWith(
                    fontSize: 17, color: notifire!.getMainText),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      side: MaterialStateBorderSide.resolveWith(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return BorderSide(color: color[index],width: 2);
                          }
                          return BorderSide(color: notifire?.getmaintext,width: 2);
                        },
                      ),
                      title: Text(name[index],
                          style: TextStyle(
                              fontSize: 14, color: notifire!.getMainText)),
                      activeColor: Colors.transparent,
                      contentPadding: const EdgeInsets.all(0),
                      checkColor: color[index],
                      // selected: _value4,
                      dense: true,
                      value: select1.contains(index) ? true : false,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool? value) {
                        if (select1.contains(index)) {
                          setState(() {
                            select1.remove(index);
                          });
                        } else {
                          setState(() {
                            select1.add(index);
                          });
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var select2 = [];

  Widget _buildoutlinecheckboxrounded() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Checkbox Rounded",
                style: mediumBlackTextStyle.copyWith(
                    fontSize: 17, color: notifire!.getMainText),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    final theme = Theme.of(context);
                    final oldCheckboxTheme = theme.checkboxTheme;

                    final newCheckBoxTheme = oldCheckboxTheme.copyWith(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                    );
                    return Theme(
                      data: theme.copyWith(checkboxTheme: newCheckBoxTheme),
                      child: CheckboxListTile(
                        side: MaterialStateBorderSide.resolveWith(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return BorderSide(color: color[index],width: 2);
                            }
                            return BorderSide(color: notifire?.getmaintext,width: 2);
                          },
                        ),
                        title: Text(name[index],
                            style: TextStyle(
                                fontSize: 14, color: notifire!.getMainText)),
                        activeColor: Colors.transparent,
                        contentPadding: const EdgeInsets.all(5),
                        checkColor: color[index],
                        dense: true,
                        value: select2.contains(index) ? true : false,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool? value) {
                          if (select2.contains(index)) {
                            setState(() {
                              select2.remove(index);
                            });
                          } else {
                            setState(() {
                              select2.add(index);
                            });
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var result;
  Widget _buildradioDefault() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Radio Default",
                style: mediumBlackTextStyle.copyWith(
                    fontSize: 17, color: notifire!.getMainText),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                        value: name[index],
                        fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return color[index];
                          }
                          return notifire?.getmaintext;
                        }),
                        activeColor: color[index],
                        title: Text(name[index],style: TextStyle(color: notifire?.getMainText)),
                        groupValue: result,
                        onChanged: (value) {
                          setState(() {
                            result = value;
                          });
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int? select10;

  Widget _buildradioSquareDefault() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Radio Square",
                style: mediumBlackTextStyle.copyWith(
                    fontSize: 17, color: notifire!.getMainText),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10, right: 20),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                select10 = index;
                              });
                            },
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(3)),
                                  // ignore: unrelated_type_equality_checks
                                  border: Border.all(
                                      color: select10 == index
                                          ? color[index]
                                          : notifire?.getmaintext,width: 2)),
                              // ignore: unrelated_type_equality_checks
                              child: Icon(Icons.circle,
                                  size: 13,
                                  color: select10 == index
                                      ? color[index]
                                      : Colors.transparent),
                            ),
                          ),
                        ),
                        Text(name[index],style: TextStyle(color: notifire?.getMainText),)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var result1;

  Widget _buildoutlineradioDefault() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Radio Default",
                style: mediumBlackTextStyle.copyWith(
                    fontSize: 17, color: notifire!.getMainText),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10, right: 20),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                result1 = index;
                              });
                            },
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: result1==index
                                          ? color[index]
                                          : notifire?.getmaintext,width: 2)),
                            ),
                          ),
                        ),
                        Text(name[index],style: TextStyle(color: notifire?.getMainText))
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int? select11;

  Widget _buildoutlineradioSquareDefault() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Radio Square",
                style: mediumBlackTextStyle.copyWith(
                    fontSize: 17, color: notifire!.getMainText),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10, right: 20),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                select11 = index;
                              });
                            },
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(3)),
                                  // ignore: unrelated_type_equality_checks
                                  border: Border.all(
                                      color: select11==index
                                          ? color[index]
                                          : notifire?.getmaintext,width: 2)),
                            ),
                          ),
                        ),
                        Text(name[index],style: TextStyle(color: notifire?.getMainText))
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
