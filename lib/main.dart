import 'package:flutter/material.dart';
import 'package:graph_practice/screen/dougnut/double_first_doughnut.dart';
import 'package:graph_practice/screen/dougnut/double_second_doughnut.dart';
import 'package:graph_practice/screen/dougnut/single_dougnut.dart';
import 'package:graph_practice/screen/dougnut/weird_line_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageView(
        scrollDirection: Axis.vertical,
        children: [
          const DoubleFirstDoughnut(outerValue: 10, innerValue: 10),
          DoubleSecondDoughnut.load(),
          const SingleDoughnut(totalPercentage: 70, expectedPercentage: 90),
          WeirdLineChart.load(),
        ],
      ),
    );
  }
}
