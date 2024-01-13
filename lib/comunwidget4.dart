import 'package:buzz/appstaticdata/staticdata.dart';
import 'package:buzz/provider/proviercolors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class ComunWidget4 extends StatefulWidget {

final double percentage;
final  Color maincolor;
  const ComunWidget4({Key? key, required this.percentage, required this.maincolor}) : super(key: key);

  @override
  State<ComunWidget4> createState() => _ComunWidget4State();
}

class _ComunWidget4State extends State<ComunWidget4> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifire>(
      builder: (context, value, child) => CircularPercentIndicator(
        radius: 40.0,
        lineWidth: 4.0,
        animation: true,
        percent: widget.percentage/100,
        center:  Text(
          "${widget.percentage}%",
          style:  TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
              color: notifire!.getMainText),
        ),
        backgroundColor: Colors.grey.shade300,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: widget.maincolor,
      ),
    );
  }
}
