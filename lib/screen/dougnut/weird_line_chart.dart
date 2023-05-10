import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeirdLineChart extends StatelessWidget {
  final List<_ChartData> chartData;

  const WeirdLineChart({required this.chartData, Key? key}) : super(key: key);

  factory WeirdLineChart.load() => WeirdLineChart(
        chartData: [
          _ChartData('-1', 50),
          _ChartData('0', 60),
          _ChartData('2', 12),
          _ChartData('3', 6),
          _ChartData('4', 20),
          _ChartData('5', 30),
          _ChartData('6', 10),
          _ChartData('7', 8),
          _ChartData('8', 50),
          _ChartData('9', 60),
          _ChartData('10', 20),
          _ChartData('11', 50),
          _ChartData('12', 100),
          _ChartData('13', 80),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final totalLength = _getTotalLength();
    return SafeArea(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Scaffold(
          body: Center(
            child: SizedBox(
              width: 350,
              height: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Spacer(
                          flex: totalLength - chartData.first.y.toInt(),
                        ),
                        Text(
                          "${chartData.first.y} %",
                        ),
                        Spacer(
                          flex: chartData.first.y.toInt(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        primaryXAxis: CategoryAxis(
                          isVisible: false,
                        ),
                        primaryYAxis: NumericAxis(
                          isVisible: false,
                        ),
                        series: _getVerticalSplineSeries(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Spacer(
                          flex: totalLength - chartData.last.y.toInt(),
                        ),
                        Text(
                          "${chartData.last.y} %",
                        ),
                        Spacer(
                          flex: chartData.last.y.toInt(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  int _getTotalLength() {
    var min = chartData.first.y;
    var max = min;
    for (var e in chartData) {
      if (e.y > max) {
        max = e.y;
      } else if (e.y < min) {
        min = e.y;
      }
    }
    return max.toInt() + 1;
  }

  /// Returns the list of chart series
  /// which need to render on the vertical spline chart.
  List<SplineSeries<_ChartData, String>> _getVerticalSplineSeries() {
    return <SplineSeries<_ChartData, String>>[
      SplineSeries<_ChartData, String>(
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          width: 2,
          name: 'London'),
    ];
  }
}

/// Private class for storing the spline series data points.
class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
