import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart7 extends StatefulWidget {
  const Chart7({super.key});

  @override
  Chart7State createState() => Chart7State();
}

class Chart7State extends State<Chart7> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries>[
          SplineAreaSeries<SalesData, String>(
            dataSource: <SalesData>[
              SalesData('Jan', 35),
              SalesData('Feb', 28),
              SalesData('Mar', 34),
              SalesData('Apr', 32),
              SalesData('May', 40),
            ],
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
        ],
    );
  }
}

class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}
