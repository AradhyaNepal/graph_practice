import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraph extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  BarGraph({Key? key}) : super(key: key);

  @override
  BarGraphState createState() => BarGraphState();
}

class BarGraphState extends State<BarGraph> {
  late List<ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<ChartData> chartData = [
      ChartData(2010, 35, 23, 21),
      ChartData(2011, 38, 49, 41),
      ChartData(2012, 34, 12, 11),
      ChartData(2013, 52, 33, 31),
      ChartData(2014, 40, 30, 31)
    ];

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 25,
              top: 50,
              bottom: 50,
            ),
            child: SfCartesianChart(
              legend: Legend(
                isVisible: true,
                isResponsive: true,
              ),
              primaryXAxis: CategoryAxis(
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
              enableSideBySideSeriesPlacement: true,
              series: <ChartSeries<ChartData, int>>[
                ColumnSeries<ChartData, int>(
                    name: "Pizza",
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y),
                ColumnSeries<ChartData, int>(
                    name: "Burger",
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y1),
                ColumnSeries<ChartData, int>(
                    name: "Fried Rice",
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1, this.y2);

  final int x;
  final double y;
  final double y1;
  final double y2;
}
