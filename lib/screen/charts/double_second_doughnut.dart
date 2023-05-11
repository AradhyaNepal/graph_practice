import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoubleData {
  String heading;
  int value;
  Color color;

  DoubleData({
    required this.heading,
    required this.value,
    required this.color,
  });

  double getPercentage(int total) {
    return value / total;
  }
}

class DoubleSecondDoughnut extends StatelessWidget {
  final List<DoubleData> data;

  const DoubleSecondDoughnut({required this.data, Key? key}) : super(key: key);
  factory DoubleSecondDoughnut.load()=>DoubleSecondDoughnut(data: [
    DoubleData(
      heading: 'Value 1',
      value: 200,
      color: Colors.red,
    ),
    DoubleData(
      heading: 'Value 2',
      value: 100,
      color: Colors.green,
    ),
    DoubleData(
      heading: 'Value 3',
      value: 150,
      color: Colors.blue,
    ),
    DoubleData(
      heading: 'Value 4',
      value: 221,
      color: Colors.grey,
    ),
    DoubleData(
      heading: 'Value 5',
      value: 125,
      color: Colors.yellow,
    ),
    DoubleData(
      heading: 'Value 6',
      value: 125,
      color: Colors.pink,
    ),
    DoubleData(
      heading: 'Value 7',
      value: 125,
      color: Colors.black,
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    int downCount = data.length ~/ 2;
    int upperCount = data.length - downCount;
    final upperList = data.sublist(0, upperCount);
    final downList = data.sublist(upperCount, data.length);
    int upperTotal = upperList.fold(
        0, (previousValue, element) => element.value + previousValue);
    int lowerTotal = downList.fold(
        0, (previousValue, element) => element.value + previousValue);
    final upperChartList = upperList.map((e) =>
        _ChartData(
          e.heading, e.getPercentage(upperTotal),
        )).toList();
    final lowerChartList = downList.map((e) =>
        _ChartData(
          e.heading, e.getPercentage(lowerTotal),
        )).toList();
    return SafeArea(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Scaffold(
          body: Row(
            children: [
              Expanded(
                flex: 3,
                child: Transform.scale(
                  scale: 0.6,
                  child: Stack(
                    children: [
                      Transform.rotate(
                        angle: _getRadianFromAngle(120),
                        child: SfCircularChart(series: [
                          DoughnutSeries<_ChartData, String>(
                            radius: "200",
                            innerRadius: "150",
                            pointColorMapper: (_, i) {
                              return upperList[i].color;
                            },
                            dataSource: upperChartList,
                            xValueMapper: (_ChartData data, _) => data.x,
                            yValueMapper: (_ChartData data, _) => data.y,
                            name: 'First',
                          ),
                        ]),
                      ),
                      Transform.rotate(
                        angle: _getRadianFromAngle(60),
                        child: SfCircularChart(series: [
                          DoughnutSeries<_ChartData, String>(
                            radius: "150",
                            innerRadius: "100",
                            pointColorMapper: (_, i) {
                              return downList[i].color;
                            },
                            dataSource: lowerChartList,
                            xValueMapper: (_ChartData data, _) => data.x,
                            yValueMapper: (_ChartData data, _) => data.y,
                            name: 'Second',
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 5,),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:data.map((e) => ItemIndexWidget(doubleData: e)).toList(),
                ),
              ),
              const SizedBox(width: 5,),
            ],
          ),
        ),
      ),
    );
  }

  double _getRadianFromAngle(double angle) => angle * ((22 / 7) / 180);
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

class ItemIndexWidget extends StatelessWidget {
  final DoubleData doubleData;

  const ItemIndexWidget({required this.doubleData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: doubleData.heading,
      triggerMode: TooltipTriggerMode.tap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 7.5),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 15,
                width: double.infinity,
                color: doubleData.color,
              ),
            ),
            const SizedBox(width: 5,),
            Expanded(
              flex: 2,
              child: Text(
                doubleData.heading,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),),
          ],
        ),
      ),
    );
  }
}
