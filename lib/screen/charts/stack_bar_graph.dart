import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class StackBarGraph extends StatelessWidget {
  const StackBarGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  SizedBox(
      height: size.height,
      width: size.width,
      child: Scaffold(
        body: Center(
          child: SfCartesianChart(
            title: ChartTitle(text: 'Sales by Category'),
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries>[
              StackedBarSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.category,
                yValueMapper: (ChartData data, _) => data.value,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String category;
  final double value;

  ChartData(this.category, this.value);
}

final List<ChartData> chartData = [
  ChartData('Clothing', 12000),
  ChartData('Shoes', 8000),
  ChartData('Accessories', 5000),
];
