import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IncomeVsExpenseChart extends StatelessWidget {
  const IncomeVsExpenseChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<ChartData1> chartData1 = [
      ChartData1('Jan', -20, 10),
      ChartData1('Feb', -30, 11),
      ChartData1('Mar', -6, 30),
      ChartData1(
        'Apr',
        -18,
        16,
      )
    ];
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          right: 50,
          top: 50,
          bottom: 50,
        ),
        height: size.height,
        width: size.width,
        child: SfCartesianChart(
            legend: Legend(
              isVisible: true,
              isResponsive: true,
            ),
            primaryXAxis: CategoryAxis(
              desiredIntervals: 50,
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
            // primaryXAxis: NumericAxis(maximumLabelWidth: 90),
            series: <ChartSeries>[
              StackedColumnSeries<ChartData1, String>(
                  name: "Expense",
                  dataSource: chartData1,
                  color: Colors.red,
                  xValueMapper: (ChartData1 data, _) => data.x,
                  yValueMapper: (ChartData1 data, _) => data.y1),
              StackedColumnSeries<ChartData1, String>(
                  name: "Income",
                  dataSource: chartData1,
                  color: Colors.blue,
                  xValueMapper: (ChartData1 data, _) => data.x,
                  yValueMapper: (ChartData1 data, _) => data.y2),
            ]),
      ),
    );
  }
}

class ChartData1 {
  ChartData1(this.x, this.y1, this.y2);

  final String x;
  final int y1;
  final int y2;
}
