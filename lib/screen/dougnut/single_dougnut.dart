import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SingleDoughnut extends StatelessWidget {
  final double totalPercentage;
  final double expectedPercentage;

  const SingleDoughnut({required this.totalPercentage,required this.expectedPercentage, Key? key}) : super(key: key);

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
                    angle: _getRadianFromAngle(180),
                    child: SfCircularChart(
                        series: [
                      DoughnutSeries<_ChartData, String>(
                        animationDuration: 150,
                        radius: "200",
                        innerRadius:"125",
                        pointColorMapper: (_, i)
                        {
                          return i == 0 ? Colors.blue : Colors.grey.shade300;
                        },
                        dataSource: [
                          _ChartData('', totalPercentage),
                          _ChartData('', 100-totalPercentage),
                        ],
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y,
                        name: 'Available',
                      ),

                    ]),
                  ),
                  Positioned.fill(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Net profit Margin"),
                          const SizedBox(height: 20,),
                          Text(
                            "$totalPercentage %",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Target:"
                              ),
                              const SizedBox(width: 5,),
                              Text(
                                "$expectedPercentage %",
                                style: const TextStyle(
                                  color: Colors.blue
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                  )
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
