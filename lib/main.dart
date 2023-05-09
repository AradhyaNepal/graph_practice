import 'package:flutter/material.dart';
import 'package:graph_practice/screen/dougnut/double_first_doughnut.dart';
import 'package:graph_practice/screen/dougnut/double_second_doughnut.dart';
import 'package:graph_practice/screen/dougnut/single_dougnut.dart';

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
      home: SingleChildScrollView(
        child: Column(
          children: [
            const DoubleFirstDoughnut(outerValue: 10, innerValue: 30),
            DoubleSecondDoughnut(
              data: [
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
              ],
            ),
            const SingleDoughnut(totalPercentage: 70, expectedPercentage: 90),
          ],
        ),
      ),
    );
  }
}
