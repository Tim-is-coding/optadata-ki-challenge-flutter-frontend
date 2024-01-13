
import 'package:buzz/Widgets/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'Widgets/comuntitle.dart';
import 'Widgets/textfilde.dart';
import 'appstaticdata/staticdata.dart';
import 'comunbottombar.dart';
import 'filepickerclass.dart';
import 'provider/proviercolors.dart';

class CreateNewPage extends StatefulWidget {
  const CreateNewPage({Key? key}) : super(key: key);

  @override
  State<CreateNewPage> createState() => _CreateNewPageState();
}

class _CreateNewPageState extends State<CreateNewPage> {
  bool istrue = false;
  @override
  void dispose() {
  projecttitle.dispose();
  clientname.dispose();
  clientname1.dispose();
    super.dispose();
  }

  TextEditingController projecttitle = TextEditingController();
  TextEditingController clientname = TextEditingController();
  TextEditingController clientname1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifire>(
      builder: (context, value, child) {
        return Container(
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
                return   SizedBox(
                  height: 900,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        const ComunTitle(title: 'Create New',path: "Project"),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            // height: 1300,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              color: notifire!.getcontiner,
                              boxShadow: boxShadow,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ComunTextField(title: 'Project Title', hinttext: 'Project Name', controller: projecttitle,),
                                  const SizedBox(height: 20,),
                                  ComunTextField(title: 'Client name', hinttext: 'Project Name', controller: clientname1,),
                                  const SizedBox(height: 20.0),
                                  ComunTextField(title: 'Project Rate', hinttext: 'Name client or company name', controller: clientname,),
                                  const SizedBox(height: 20.0),
                                  _buildprojecttype(),
                                  const SizedBox(height: 20.0),
                                  _buildpriority(),
                                  const SizedBox(height: 20.0),
                                  _buildprojectsize(),
                                  const SizedBox(height: 20.0),
                                  _buildstartingdate(),
                                  const SizedBox(height: 20.0),
                                  _buildendingdate(),
                                  const SizedBox(height: 20.0),
                                  _buildEntersomedetil(),
                                  const SizedBox(height: 20,),
                                   Text("Upload project file",style: TextStyle(color: notifire!.getMainText,fontSize: 14),),
                                  const FilePickerClass(),
                                  _buildButtons(),

                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizeBoxx(),
                        const ComunBottomBar(),
                      ],
                    ),
                  ),
                );
              } else if (constraints.maxWidth < 1200) {
                return   SizedBox(
                  height: 1000,
                  width: double.infinity,

                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const ComunTitle(title: 'Create New',path: "Project"),
                        Row(
                          children: [
                            Expanded(child: _buidui())
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
                return   SizedBox(
                  height: 1000,
                  width: double.infinity,

                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const ComunTitle(title: 'Create New',path: "Project"),

                        Row(
                          children: [
                            Expanded(child: _buidui())
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
        );
      },
    );
  }
  List<String> dropdownOptions = ['Fix price', 'Hourly'];
  List<String> dropdownOptions1 = ['Low', 'Medium', 'High','Urgent'];
  List<String> dropdownOptions2 = ['Small', 'Medium', 'Big'];
  String? selectedOption;
  String? selectedOption1;
  String? selectedOption2;
  final TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  final TextEditingController _enddate = TextEditingController();
  DateTime _endselectedDate = DateTime.now();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(), // Use your desired theme
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat.yMMMd().format(picked);
      });
    }
  }
  Future<void> _endselectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endselectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(), // Use your desired theme
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _endselectedDate = picked;
        _enddate.text = DateFormat.yMMMd().format(picked);
      });
    }
  }
Widget _buidui(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        // height: 900,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
   child: Center(
     child: Padding(
       padding: const EdgeInsets.all(15.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [

            ComunTextField(title: 'Project Title', hinttext: 'Project Name', controller: projecttitle,),
            const SizedBox(height: 20,),
            ComunTextField(title: 'Client name', hinttext: 'Project Name', controller: clientname,),
           const SizedBox(height: 20.0),
           Row(
             children: [
               Expanded(child: ComunTextField(title: 'Project Rate', hinttext: 'Name client or company name', controller: clientname,)),
               const SizedBox(width: 20.0),
               Expanded(child: _buildprojecttype()),
               const SizedBox(width: 20.0),
               Expanded(child: _buildpriority()),
             ],
           ),

           const SizedBox(height: 20,),


           Row(
             children: [
               Expanded(child: _buildprojectsize()),
               const SizedBox(width: 20,),
               Expanded(child:_buildstartingdate()),
               const SizedBox(width: 20,),
               Expanded(child: _buildendingdate()),
             ],
           ),
            const SizedBox(height: 20.0),

           Row(
             children: [
               Expanded(
                 child: _buildEntersomedetil(),
               ),
             ],
           ),
           const SizedBox(height: 20,),
            Text("Upload project file",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),),
           const FilePickerClass(),

           _buildButtons()
         ],
       ),
     ),
   ),
      ),
    );
}

Widget _buildprojecttype(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("Project Type",style:mediumBlackTextStyle.copyWith(color: notifire!.getMainText),),
        const SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.3)),
              borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
          child: DropdownButtonFormField<String>(
            dropdownColor: notifire!.getcontiner,
            value: selectedOption,
            padding: const EdgeInsets.only(left: 10),
            items: dropdownOptions.map((String option) {
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
            style: TextStyle(color: notifire!.getMainText),
            decoration:  InputDecoration(
              hintStyle: mediumGreyTextStyle.copyWith(fontSize: 13),
              hintText: 'Select an option',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
}

  Widget _buildpriority(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("Priority",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),),
        const SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.3)),
              borderRadius: const BorderRadius.all(Radius.circular(8))
          ),
          child: DropdownButtonFormField<String>(
            style: TextStyle(color: notifire!.getMainText),
            dropdownColor: notifire!.getcontiner,
            padding: const EdgeInsets.only(left: 10),
            value: selectedOption1,
            items: dropdownOptions1.map((String option) {
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
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildprojectsize(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("Project Size",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),),
        const SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.3)),
              borderRadius: const BorderRadius.all(Radius.circular(8))
          ),
          child: DropdownButtonFormField<String>(
            style: TextStyle(color: notifire!.getMainText),
            dropdownColor: notifire!.getcontiner,
            padding: const EdgeInsets.only(left: 10),
            value: selectedOption2,
            items: dropdownOptions2.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedOption2 = newValue;
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
    );
  }
  Widget _buildstartingdate(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("Starting date",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),),
        const SizedBox(height: 10,),
        GestureDetector(
          onTap: () {
            _selectDate(context);
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
                borderRadius: const BorderRadius.all(Radius.circular(8))
            ),
            child: AbsorbPointer(
              child: TextFormField(
                style: TextStyle(color: notifire!.getMainText),
                controller: _dateController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildendingdate(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("Ending date",style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),),
        const SizedBox(height: 10,),
        GestureDetector(
          onTap: () {
            _endselectDate(context);
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
                borderRadius: const BorderRadius.all(Radius.circular(8))
            ),
            child: AbsorbPointer(
              child: TextFormField(
                style: TextStyle(color: notifire!.getMainText),
                controller: _enddate,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildEntersomedetil(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("Enter some Details",style:mediumBlackTextStyle.copyWith(color: notifire!.getMainText),),
        const SizedBox(height: 10,),
        Container(
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(color:  Colors.grey.withOpacity(0.3),width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
          child:  TextField(
            style: TextStyle(color: notifire!.getMainText),
            decoration: const InputDecoration(

                border: InputBorder.none
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color(0xff54ba4a),
            ),
            child: const Text("Add",style: TextStyle(color: Colors.white,fontSize: 15),)),
        const SizedBox(width: 20,),

        ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color(0xfffc4438),
            ),
            child: const Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 15),)),
      ],
    );
  }

}

