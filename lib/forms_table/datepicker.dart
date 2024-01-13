

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Widgets/comuntitle.dart';
import '../appstaticdata/staticdata.dart';
import '../provider/proviercolors.dart';





class DatePickerPage extends StatefulWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {

  DateTime selectedDateAndTime = DateTime.now();
  var selectedDate = DateFormat('d-MM-yyyy');
  TimeOfDay selectedTime = TimeOfDay.now();



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
              return  SizedBox(
                height: 900,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const ComunTitle(title: 'DatePicker',path: "Forms"),

                      buildclender1(),
                      buildBootstrapCalendar()

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
                      const ComunTitle(title: 'DatePicker',path: "Forms"),


                      buildclender1(),
                      buildBootstrapCalendar()


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
                      const ComunTitle(title: 'DatePicker',path: "Forms"),
                      Row(
                        children: [
                          Expanded(child: buildclender1()),
                          Expanded(child: buildBootstrapCalendar())
                        ],
                      ),


                      // SfDateRangePicker(
                      //   view: DateRangePickerView.year,
                      // )




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
  Widget buildBootstrapCalendar() {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
         height: 450,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

               Text("Calendar",style: mainTextStyle.copyWith(color: notifire!.getMainText),),
              Divider(color: Colors.grey.shade300,height: 60,),

              _buildCalendarRow(title: 'Date and time', contante: selectedDateAndTime.toString(), icon: 'assets/calendar.svg',ontap: () {_selectDateAndTime();},),
              const SizedBox(height: 20,),
              _buildCalendarRow(title: 'Date', contante: selectedDate.format(selectedDateAndTime), icon: 'assets/calendar.svg',ontap: () {_selectDateAndTime();},),
              const SizedBox(height: 20,),
              _buildCalendarRow(title: 'Month', contante: selectedDateAndTime.toString(), icon: 'assets/calendar.svg',ontap: () {handleReadOnlyInputClick(context);},),
              const SizedBox(height: 20,),
              _buildCalendarRow(title: 'Week', contante: selectedDateAndTime.toString(), icon: 'assets/calendar.svg',ontap: () {_selectDateAndTime();},),
              const SizedBox(height: 20,),
              _buildCalendarRow(title: 'Time', contante: selectedTime.format(context), icon: 'assets/clock.svg',ontap: () {_selectTime();},),
              const SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }


  Widget _buildCalendarRow({required String title,required String contante,required String icon, void Function()? ontap}){
    return Row(
      children: [
        
         Expanded(
           flex: 1,
           child: SizedBox(
               height: 40,
               child: Center(child: Text(title,style: mediumBlackTextStyle.copyWith(color: notifire!.getMainText),))),
         ),
        Expanded(
          flex: 3,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey.shade200)
            ),
            child: Center(
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.top,
                title:  Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(contante,style: TextStyle(color: notifire!.getMainText)),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: InkWell(
                      onTap: ontap,
                      child: SvgPicture.asset(icon,color: notifire!.getMainText,)),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
  void handleReadOnlyInputClick(context) {
    showBottomSheet(
        context: context,
        builder: (BuildContext context) => SizedBox(
          width: MediaQuery.of(context).size.width,
          child: YearPicker(
            selectedDate: DateTime(1997),
            firstDate: DateTime(1995),
            lastDate: DateTime.now(),
            onChanged: (val) {
              Navigator.pop(context);
            },
          ),
        )
    );
  }
  Future<void> _selectDateAndTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateAndTime,
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null && pickedDate != selectedDateAndTime) {
      setState(() {
        selectedDateAndTime = pickedDate;
      });
    }
  }



  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }
}



Widget buildclender1() {
  return Padding(
    padding: const EdgeInsets.all(padding),
    child: Container(
      // height: 450,
      decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             Text("Default calendar",style: mainTextStyle.copyWith(color: notifire!.getMainText),),
            Divider(color: Colors.grey.shade300,height: 50,),
            SizedBox(
              child: Center(
                child: TableCalendar(
                  rowHeight: 50,
                  locale: 'en_US',
                  headerStyle:  HeaderStyle(
                      formatButtonVisible: false, titleCentered: true,titleTextStyle: TextStyle(color: notifire!.getMainText)),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, DateTime.now()),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}



