
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../appstaticdata/staticdata.dart';
import '../provider/proviercolors.dart';



class CheckboxRadioPage extends StatefulWidget {
  const CheckboxRadioPage({Key? key}) : super(key: key);

  @override
  State<CheckboxRadioPage> createState() => _CheckboxRadioPageState();
}

class _CheckboxRadioPageState extends State<CheckboxRadioPage> {



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
                      const ComunTitle(title: 'Checkbox & Radio',path: "Forms"),
                      _buildcheckbox(size: 380,width: constraints.maxWidth)


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
                      const ComunTitle(title: 'Checkbox & Radio',path: "Forms"),
                      _buildcheckbox(size: 50,width: constraints.maxWidth)



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
                      const ComunTitle(title: 'Checkbox & Radio',path: "Forms"),
                      _buildcheckbox(size: 0,width: constraints.maxWidth)

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
  bool _value2= false;
  bool _value3= false;
  Widget _buildcheckbox({required double size,required double width}){
    return  Padding(
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
               Text("Default checkbox",style: mainTextStyle.copyWith(fontSize: 22,color: notifire!.getMainText),),

              Divider(color: Colors.grey.shade300,height: 60,),



              width<600 ? Column(
                children: [
                  _buildDefault(),
                  _buildDisabled(),
                  _buildRightChecks(),
                  _buildIndeterminate(),
                ],
              ) : width<1000 ?  Column(
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
                ],
              ):
              Column(
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
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDefault(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)
        ),
        child:  Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("Default Checks",style: mediumBlackTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText),),
              const SizedBox(height: 15,),

              CheckboxListTile(

                title:   Text('Default checkbox',style: TextStyle(fontSize: 14,color: notifire!.getMainText)),
                activeColor: appMainColor,
                contentPadding: const EdgeInsets.all(0),
                checkColor: Colors.white,
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

                title:  const Text('Checked checkbox',style: TextStyle(fontSize: 14,)),
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

  Widget _buildDisabled(){
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child:  Container(
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)
        ),
        child:  Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("Disabled Checks",style: mediumBlackTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText),),
              const SizedBox(height: 15,),

              CheckboxListTile(

                title:  Text('Disabled checkbox',style: mediumGreyTextStyle),
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
                onChanged: (bool? value) {

                },
              ),
              CheckboxListTile(

                title:  Text('Disabled checked ',style: mediumGreyTextStyle),
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
                onChanged: (bool? value) {

                },
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildRightChecks(){
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)
        ),
        child:  Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  SizedBox()
                ],
              ),
               Text("Right Checks",style: mediumBlackTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText),),
              const SizedBox(height: 15,),

              SizedBox(
                width: 180,
                child: CheckboxListTile(

                  title:    Text('Reverse checkbox',style: TextStyle(fontSize: 14,color: notifire!.getMainText)),
                  activeColor: appMainColor,
                  contentPadding: const EdgeInsets.all(0),
                  checkColor: Colors.white60,
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
                  title:  Text('Disabled reverse checkbox',style: mediumGreyTextStyle),
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
                  onChanged: (bool? value) {

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildIndeterminate(){
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)
        ),
        child:  Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("Indeterminate",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: notifire!.getMainText),),
              const SizedBox(height: 15,),

              CheckboxListTile(

                title: const Text('Indeterminate checkbox',style: TextStyle(fontSize: 14)),
                activeColor: appMainColor,
                contentPadding: const EdgeInsets.all(0),
                checkColor: Colors.white,
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
}

