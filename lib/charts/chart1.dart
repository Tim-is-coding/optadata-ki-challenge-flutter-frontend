import 'package:buzz/provider/proviercolors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../appstaticdata/staticdata.dart';

class Chart1 extends StatelessWidget {
  const Chart1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<ColorNotifire>(
      builder: (context, value, child) => SfCartesianChart(
        title: ChartTitle(text: 'Sales Performance',textStyle: TextStyle(color: notifire!.getMainText)),
        legend: Legend(isVisible: true),
        series: <ChartSeries>[
          // Line series
          LineSeries<SalesData, num>(
            dataSource: <SalesData>[
              SalesData(2010, 35),
              SalesData(2011, 28),
              SalesData(2012, 34),
              SalesData(2013, 32),
              SalesData(2014, 48),

            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            name: 'Sales',
          ),
          // Column series
          ColumnSeries<SalesData, num>(
            dataSource: <SalesData>[
              SalesData(2010, 30),
              SalesData(2011, 35),
              SalesData(2012, 28),
              SalesData(2013, 36),
              SalesData(2014, 40),

            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            name: 'Profit',
          ),
          // Area series
          AreaSeries<SalesData, num>(
            dataSource: <SalesData>[
              SalesData(2010, 20),
              SalesData(2011, 25),
              SalesData(2012, 22),
              SalesData(2013, 30),
              SalesData(2014, 42),

            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            name: 'Expenses',
          ),
        ],
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(),

      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final int year;
  final int sales;
}
