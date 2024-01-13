import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart5 extends StatelessWidget {
  const Chart5({super.key});

  @override
  Widget build(BuildContext context) {
    return  SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries>[
          SplineSeries<SalesData, String>(
            dataSource: <SalesData>[
              SalesData('Jan', 35, 30),
              SalesData('Feb', 28, 25),
              SalesData('Mar', 34, 32),
              SalesData('Apr', 32, 27),
              SalesData('May', 40, 38),
            ],
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.sales1,
            name: 'Line 1', // Name of the first line
          ),
          SplineSeries<SalesData, String>(
            dataSource: <SalesData>[
              SalesData('Jan', 25, 20),
              SalesData('Feb', 18, 15),
              SalesData('Mar', 24, 22),
              SalesData('Apr', 22, 17),
              SalesData('May', 30, 28),
            ],
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.sales2,
            name: 'Line 2', // Name of the second line
          ),
        ],
    );
  }
}

class SalesData {
  final String month;
  final double sales1;
  final double sales2;

  SalesData(this.month, this.sales1, this.sales2);
}
