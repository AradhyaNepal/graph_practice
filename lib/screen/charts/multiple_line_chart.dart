import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MultipleLineChart extends StatefulWidget {
  const MultipleLineChart({super.key});

  @override
  State<MultipleLineChart> createState() => _MultipleLineChartState();
}

class _MultipleLineChartState extends State<MultipleLineChart> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<SalesData> chartData1 = [
      SalesData(DateTime.parse("2010-05-09"), 35),
      SalesData(DateTime.parse("2011-05-09"), 28),
      SalesData(DateTime.parse("2012-05-09"), 34),
      SalesData(DateTime.parse("2013-05-09"), 32),
      SalesData(DateTime.parse("2014-05-09"), 40)
    ];
    final List<SalesData> chartData2 = [
      SalesData(DateTime.parse("2010-05-09"), 25),
      SalesData(DateTime.parse("2011-05-09"), 30),
      SalesData(DateTime.parse("2012-05-09"), 32),
      SalesData(DateTime.parse("2013-05-09"), 25),
      SalesData(DateTime.parse("2014-05-09"), 50)
    ];
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 30,
            top: 100,
            bottom: 100,
          ),
          child: SfCartesianChart(
            legend: Legend(
              isVisible: true,
              isResponsive: true,
            ),
            primaryXAxis: DateTimeAxis(
              isVisible: true,
              title: AxisTitle(
                text: "-- -- -- -- Year -- -- -- --",
              ),
            ),
            primaryYAxis: NumericAxis(
              isVisible: true,
              title: AxisTitle(
                text: "-- -- -- -- Growth -- -- -- --",
              ),
            ),
            tooltipBehavior: TooltipBehavior(
              enable: true,
              color: Colors.grey.shade500,
              builder: (data, point, series, pointIndex, seriesIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 7.5,
                  ),
                  child: Text(
                    "${(point as CartesianChartPoint).y}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
            series: <ChartSeries>[
              LineSeries<SalesData, DateTime>(
                  name: "What is this??",
                  dataSource: chartData1,
                  enableTooltip: true,
                  markerSettings: const MarkerSettings(isVisible: true),
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales),
              LineSeries<SalesData, DateTime>(
                  name: "What is this too??",
                  dataSource: chartData2,
                  markerSettings: const MarkerSettings(isVisible: true),
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final DateTime year;
  final double sales;
}
