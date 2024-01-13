import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart3 extends StatelessWidget {
  const Chart3({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: NumericAxis(), // X-axis as numeric axis
        primaryYAxis: NumericAxis(),
        series: <ChartSeries>[
          SplineSeries<SalesData, double>(
            dataSource: <SalesData>[
              SalesData(0, 35,46),
              SalesData(1, 28,64),
              SalesData(2, 34,52),
              SalesData(3, 32,44),
              SalesData(4, 40,33),
            ],
            xValueMapper: (SalesData sales, _) => sales.x,
            yValueMapper: (SalesData sales, _) => sales.y1,
            name: 'Line 1',
          ),
          SplineSeries<SalesData, double>(
            dataSource: <SalesData>[
              SalesData(0, 25,25),
              SalesData(1, 18,64),
              SalesData(2, 24,22),
              SalesData(3, 22,54),
              SalesData(4, 30,74),
            ],
            xValueMapper: (SalesData sales, _) => sales.x,
            yValueMapper: (SalesData sales, _) => sales.y2,
            name: 'Line 2',
          ),
        ],
    );
  }
}

class SalesData {
  final double x;
  final double y1;
  final double y2;

  SalesData(this.x, this.y1, this.y2);
}
