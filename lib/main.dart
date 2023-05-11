import 'package:flutter/material.dart';
import 'package:graph_practice/screen/charts/bar_graph.dart';
import 'package:graph_practice/screen/charts/circular_progress.dart';
import 'package:graph_practice/screen/charts/curved_line_chart.dart';
import 'package:graph_practice/screen/charts/double_first_doughnut.dart';
import 'package:graph_practice/screen/charts/double_second_doughnut.dart';
import 'package:graph_practice/screen/charts/income_vs_expense.dart';
import 'package:graph_practice/screen/charts/multiple_line_chart.dart';
import 'package:graph_practice/screen/charts/single_dougnut.dart';
import 'package:graph_practice/screen/charts/stack_bar_graph.dart';

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
          const DoubleFirstDoughnut(outerValue: 67, innerValue: 40),
          DoubleSecondDoughnut.load(),
          const SingleDoughnut(totalPercentage: 70, expectedPercentage: 90),
          CurvedLineChart.load(),
          const MultipleLineChart(),
          BarGraph(),
          const IncomeVsExpenseChart(),
          const StackBarGraph(),
        ],
      ),
    );
  }
}
