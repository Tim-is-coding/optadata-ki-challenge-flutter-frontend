import 'package:buzz/appstaticdata/staticdata.dart';
import 'package:buzz/provider/proviercolors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class ComunWidget4 extends StatelessWidget {
  final double percentage;
  final bool big;

  ComunWidget4({Key? key, required this.percentage, this.big = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.lightGreen;
    if (percentage < 0.3) {
      color = Colors.redAccent;
    } else if (percentage < 0.6) {
      color = Colors.orangeAccent;
    } else {
      color = Colors.lightGreen;
    }

    return Consumer<ColorNotifire>(
      builder: (context, value, child) => CircularPercentIndicator(
        curve: Curves.easeOut,
        animationDuration: 3000,
        radius: big ? 70 : 40.0,
        lineWidth: big ? 8 : 4.0,
        animation: true,
        percent: percentage,
        animateFromLastPercent: true,
        center: Text(
          "${(percentage * 100).toInt()}%",
          style: TextStyle(
              fontSize: big ? 22 : 13.0,
              fontWeight: big ? FontWeight.w800 : FontWeight.w600,
              color: color),
        ),
        backgroundColor: Colors.grey.shade900,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: color,
      ),
    );
  }
}

// class _ComunWidget4State extends State<ComunWidget4> {
//   @override
//   Widget build(BuildContext context) {
//     Color color = Colors.lightGreen;
//     if (widget.percentage < 0.3) {
//       color = Colors.redAccent;
//     } else if (widget.percentage < 0.6) {
//       color = Colors.orangeAccent;
//     } else {
//       color = Colors.lightGreen;
//     }
//
//     return Consumer<ColorNotifire>(
//       builder: (context, value, child) => CircularPercentIndicator(
//         curve: Curves.easeOut,
//         animationDuration: 3000,
//         radius: widget.big ? 70 : 40.0,
//         lineWidth: widget.big ? 8 : 4.0,
//         animation: true,
//         percent: widget.percentage,
//         animateFromLastPercent: true,
//         center: Text(
//           "${(widget.percentage * 100).toInt()}%",
//           style: TextStyle(
//               fontSize: widget.big ? 18 : 13.0,
//               fontWeight: FontWeight.w600,
//               color: notifire!.getMainText),
//         ),
//         backgroundColor: Colors.grey.shade900,
//         circularStrokeCap: CircularStrokeCap.round,
//         progressColor: color,
//       ),
//     );
//   }
// }
