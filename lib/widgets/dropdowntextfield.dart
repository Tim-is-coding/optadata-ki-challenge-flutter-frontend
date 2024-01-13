import 'package:flutter/material.dart';

class ComunDropDownTextField extends StatefulWidget {

   final String? selectedOption;

 final List<String> dropdownOptions;

final String title;
final String hinttext;
  const ComunDropDownTextField({Key? key, required this.selectedOption, required this.dropdownOptions, required this.title, required this.hinttext}) : super(key: key);

  @override
  State<ComunDropDownTextField> createState() => _ComunDropDownTextFieldState();
}

class _ComunDropDownTextFieldState extends State<ComunDropDownTextField> {
  List<String> dropdownOptions = [];

  String selectedOption = "";

@override
  void initState() {
    super.initState();
    dropdownOptions = widget.dropdownOptions;
    selectedOption = widget.selectedOption!;
}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(widget.title,style: const TextStyle(color: Colors.black,fontSize: 14),),
        const SizedBox(height: 10,),
        DropdownButtonFormField<String>(
    value: selectedOption,
    items: dropdownOptions.map((String option) {
    return DropdownMenuItem<String>(
    value: option,
    child: Text(option),
    );
    }).toList(),
    onChanged: (String? newValue) {
    setState(() {
    selectedOption = newValue!;
    });
    },
    decoration: const InputDecoration(
    labelText: 'Select an option',
    border: OutlineInputBorder(),
    ),
    ),
      ],
    );
  }
}
