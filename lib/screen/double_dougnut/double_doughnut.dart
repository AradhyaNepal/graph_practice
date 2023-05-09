import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoubleDoughnut extends StatelessWidget {
  final double outerValue;
  final double innerValue;

  const DoubleDoughnut({required this.outerValue,required this.innerValue, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height,
        width: size.width,
        child: SafeArea(
          child: Scaffold(
            body: Center(
              child: Stack(
                children: [
                  Transform.rotate(
                    angle: _getRadianFromAngle(120),
                    child: SfCircularChart(series: [
                      DoughnutSeries<_ChartData, String>(
                        radius: "200",
                        innerRadius:"125",
                        pointColorMapper: (_, i)
                        {
                          return i == 0 ? Colors.blue : Colors.transparent;
                        },
                        dataSource: [
                          _ChartData('', outerValue),
                          _ChartData('', 100-outerValue),
                        ],
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y,
                        name: 'Available',
                      ),

                    ]),
                  ),
                  Transform.rotate(
                    angle: _getRadianFromAngle(60),
                    child: SfCircularChart(series: [
                      DoughnutSeries<_ChartData, String>(
                        radius: "125",
                        innerRadius:"50",
                        pointColorMapper: (_, i)
                        {
                          return i == 0 ? Colors.red : Colors.transparent;
                        },
                        dataSource: [
                          _ChartData('',innerValue),
                          _ChartData('', 100-innerValue),
                        ],
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y,
                        name: 'Available',
                      ),

                    ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  double _getRadianFromAngle(double angle) => angle*((22/7)/180);
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
