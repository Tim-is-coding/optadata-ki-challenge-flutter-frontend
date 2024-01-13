import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart2 extends StatelessWidget {

  final Color? bgcolor;
  final Color bordercolor;

  const Chart2({super.key, required this.bgcolor, required this.bordercolor});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(), // Use CategoryAxis for x-axis
      primaryYAxis: NumericAxis(),
        series: <ChartSeries>[
          // Area series
          AreaSeries<SalesData, String>(
            dataSource: <SalesData>[
              SalesData('Jan', 20),
              SalesData('Feb', 28),
              SalesData('Mar', 24),
              SalesData('Apr', 22),
              SalesData('May', 20),
              SalesData('jun', 25),
              SalesData('july', 33),
            ],

            borderWidth: 2,
            borderColor: bordercolor,
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.sales,
            name: 'Sales',
            markerSettings: const MarkerSettings(isVisible: true),
            color: bgcolor,
          ),
        ],
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
    );
  }
}

class SalesData {
  SalesData(this.month, this.sales);
  final String month;
  final int sales;
}
