// ignore_for_file: deprecated_member_use

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/sizebox.dart';
import '../Widgets/textfilde.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';
import '../provider/proviercolors.dart';

class UsersEditPage extends StatefulWidget {
  const UsersEditPage({Key? key}) : super(key: key);

  @override
  State<UsersEditPage> createState() => _UsersEditPageState();
}

class _UsersEditPageState extends State<UsersEditPage> {

   @override
  void dispose() {
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
    super.dispose();
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
                      const ComunTitle(title: 'User Edit',path: "Users"),

                      _buildMyProfile(width: constraints.maxWidth),
                      _buildEditProfile(size: constraints.maxWidth),
                      // _buildAddProject(width: constraints.maxWidth),
                      const SizeBoxx(),
                      const ComunBottomBar(),
                    ],
                  ),
                ),
              );
            } else if (constraints.maxWidth < 1250) {
              return SizedBox(
                height: 1000,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'User Edit',path: "Users"),
                      _buildMyProfile(width: constraints.maxWidth),
                      _buildEditProfile(size: constraints.maxWidth),
                      // _buildAddProject(width: constraints.maxWidth),
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
                      const ComunTitle(title: 'User Edit',path: "Users"),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: _buildMyProfile(width: constraints.maxWidth),
                          ),
                          Expanded(
                            flex: 4,
                            child: _buildEditProfile(size: constraints.maxWidth),
                          )
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: _buildAddProject(width: constraints.maxWidth),
                      //     ),
                      //   ],
                      // ),
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

  Widget _buildMyProfile({required double width}) {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
         // height: 728,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
               Text(
                "My Profile",
                style:  mediumBlackTextStyle.copyWith(fontSize: 20,color: notifire!.getMainText),
              ),
              Divider(
                color: Colors.grey.shade300,
                height: 60,
              ),
               ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("assets/avatar.png")),
                title: Text("Elon musk", style: mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text("CEO", style: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Expanded(child: ComunTextField(title: 'First Name', hinttext: 'Company', controller: controller3)),
                  const SizedBox(width: 15,),
                  Expanded(child: ComunTextField(title: 'Last Name', hinttext: 'Last Name', controller: controller4)),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              DropdownDatePicker(
                inputDecoration:  InputDecoration(
                    hintStyle: mediumGreyTextStyle.copyWith(fontSize: 13),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                        borderRadius: const BorderRadius.all(Radius.circular(10))
                    ),
                    border:  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.withOpacity(0.3)),
                        borderRadius: const BorderRadius.all(Radius.circular(10))
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                ),// optional
                isDropdownHideUnderline: true, // optional
                isFormValidator: true, // optional
                textStyle: mediumGreyTextStyle,
                startYear: 1900, // optional
                // textcolor: notifire!.getMainText,
                endYear: 2023, // optional
                 // screensize: width<600? true : false,
                width: 10, // optional
                selectedDay: 14, // optional
                selectedMonth: 10, // optional
                selectedYear: 1993, // optional
              ),
              // _buildEntersomedetil(hinttext: 'On the other hand, we denounce with righteous indignation', title: 'Bio'),
              const SizedBox(
                height: 15,
              ),
              ComunTextField(
                  title: 'Email-Address',
                  hinttext: 'Yourmail@gmail.com',
                  controller: controller),
              const SizedBox(
                height: 15,
              ),
              ComunTextField(
                  title: 'Password',
                  hinttext: '............',
                  controller: controller10),
              const SizedBox(
                height: 15,
              ),
              ComunTextField(
                  title: 'Website',
                  hinttext: 'http://yourwebsit',
                  controller: controller11),
              Divider(
                color: Colors.grey.shade300,
                height: 60,
              ),
              ElevatedButton(onPressed: (){},

                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff7366ff),
                      fixedSize: const Size(100, 40)
                  ),

                  child:  Text("Save",style:  mediumBlackTextStyle.copyWith(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w200),)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditProfile({required double size}) {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        // height: size<600? 1150+30 :750,//1150
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
               Text(
                "Edit Profile",
                style:  mediumBlackTextStyle.copyWith(fontSize: 20,color: notifire!.getMainText),),
              Divider(
                color: Colors.grey.shade300,
                height: 60,
              ),

              if (size<600) Column(
                children: [
                  ComunTextField(title: 'Mobile Number', hinttext: 'Enter Number', controller: controller8),
                  const SizedBox(height: 20,),
                  ComunTextField(title: 'Email Id', hinttext: 'Enter Email Id', controller: controller1),
                  const SizedBox(height: 20,),
                  ComunTextField(title: 'Address', hinttext: 'Home Address', controller: controller5),
                 // const SizedBox(height: 20,),
                 //  ComunTextField(title: 'First Name', hinttext: 'First Name', controller: controller3),
                 // const SizedBox(height: 20,),
                 //  ComunTextField(title: 'Last Name', hinttext: 'Last Name', controller: controller4),
                  const SizedBox(height: 20,),
                  ComunTextField(title: 'Website', hinttext: 'Website Like', controller: controller5),
                  const SizedBox(height: 20,),
                  ComunTextField(title: 'Company', hinttext: 'Company', controller: controller5),
                 const SizedBox(height: 20,),
                  ComunTextField(title: 'Zip Code', hinttext: 'Zip Code', controller: controller5),
                 const SizedBox(height: 20,),
                  ComunTextField(title: 'Home Town', hinttext: 'Home Town', controller: controller6),
                  const SizedBox(height: 20,),
                  ComunTextField(title: 'City', hinttext: 'City', controller: controller7),
                  const SizedBox(height: 20,),
                  ComunTextField(title: 'Country', hinttext: 'Country', controller: controller9),
                  const SizedBox(height: 20,),
                  _buildEntersomedetil(hinttext: 'Enter about your description', title: 'About Me'),

                ],
              ) else Column(
                children: [
                  Row(
                    children: <Widget>[

                      Expanded(child: ComunTextField(title: 'Mobile Number', hinttext: 'Enter Number', controller: controller8)),
                      const SizedBox(width: 15,),
                      Expanded(child: ComunTextField(title: 'Email Id', hinttext: 'Enter Email Id', controller: controller1)),
                      // const SizedBox(width: 15,),
                      // Expanded( flex: 4,child: ComunTextField(title: 'Email-Address', hinttext: 'Email', controller: controller2)),

                    ],
                  ),
                  // const SizedBox(height: 20,),
                  // Row(
                  //   children: <Widget>[
                  //     Expanded(child: ComunTextField(title: 'First Name', hinttext: 'Company', controller: controller3)),
                  //     const SizedBox(width: 15,),
                  //     Expanded(child: ComunTextField(title: 'Last Name', hinttext: 'Last Name', controller: controller4)),
                  //
                  //   ],
                  // ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: ComunTextField(title: 'Address', hinttext: 'Home Address', controller: controller5)),
                      const SizedBox(width: 15,),
                      Expanded(child: ComunTextField(title: 'Website', hinttext: 'Website Like', controller: controller5)),
                    ],
                  ),
                  const SizedBox(height: 20,),

                  Row(
                    children: [
                      Expanded(child: ComunTextField(title: 'Company', hinttext: 'Company', controller: controller5)),
                      const SizedBox(width: 15,),
                      Expanded(child: ComunTextField(title: 'Zip Code', hinttext: 'Zip Code', controller: controller5)),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: <Widget>[

                      Expanded(flex: 4,child: ComunTextField(title: 'Home Town', hinttext: 'Home Town', controller: controller6)),
                      const SizedBox(width: 15,),
                      Expanded(flex: 3,child: ComunTextField(title: 'City', hinttext: 'City', controller: controller7)),
                      const SizedBox(width: 15,),
                      Expanded( flex: 5,child: ComunTextField(title: 'Country', hinttext: 'Country', controller: controller9)),

                    ],
                  ),
                  const SizedBox(height: 20,),
                  _buildEntersomedetil(hinttext: 'Enter about your description', title: 'About Me'),

                ],
              ),


              Divider(
                color: Colors.grey.shade300,
                height: size<600?30:80,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  ElevatedButton(onPressed: (){},

                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff7366ff),
                          fixedSize: const Size(150, 40)
                      ),

                      child:  Text("Update Profile",style: mediumBlackTextStyle.copyWith(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w200),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildEntersomedetil({required String hinttext,required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          title,
          style:  mediumBlackTextStyle.copyWith(fontSize: 14,color: notifire!.getMainText),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child:  TextField(
            style: TextStyle(color: notifire!.getMainText),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
                hintStyle: const TextStyle(color: Color(0xffc5c5c5),fontSize: 14),
                hintText: hinttext,
                border: InputBorder.none),
          ),
        ),
      ],
    );
  }



  TableRow dividertable(){
    return TableRow(
        children: [
          Divider(
            color: Colors.grey.shade300,
            height: 30,
          ),
          Divider(
            color: Colors.grey.shade300,
            height: 30,
          ),
          Divider(
            color: Colors.grey.shade300,
            height: 30,
          ),
          Divider(
            color: Colors.grey.shade300,
            height: 30,
          ),
          Divider(
            color: Colors.grey.shade300,
            height: 30,
          ),
        ]
    );
  }
}


