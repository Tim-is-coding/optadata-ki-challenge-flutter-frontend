import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart4 extends StatelessWidget {
  const Chart4({super.key});

  @override
  Widget build(BuildContext context) {
    return  SfCircularChart(
        series: <CircularSeries>[
          RadialBarSeries<ChartData, String>(
            dataSource: <ChartData>[
              ChartData('A', 50,1),
              ChartData('B', 360,3),
              ChartData('C', 145,5),
              ChartData('D', 375,6),
              ChartData('E', 50,3),
            ],
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
          ),
        ],
        legend: Legend(isVisible: true), // Enable legends
    );
  }
}

class ChartData {
  ChartData(this.category, this.value, int i);
  final String category;
  final double value;
}
