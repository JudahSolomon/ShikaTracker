import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../Widgets/ExpensesCard.dart';
import '../../constants/Colors.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20.0,
              ),
              onPressed: () {},
            ),
            title: const Text(
              "Expenses",
              style: TextStyle(
                  fontFamily: 'RobotoBold',
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0,
                  color: darkBlue),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Detailed Transactions",
                        style: TextStyle(
                          fontFamily: 'RobotoBold',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   padding: EdgeInsets.all(16.0),
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Colors.grey),
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                //   child: LineChart(
                //     LineChartData(
                //       titlesData: FlTitlesData(
                //         leftTitles: SideTitles(showTitles: true, interval: 1),
                //         bottomTitles: SideTitles(showTitles: true),
                //       ),
                //       gridData: FlGridData(show: true),
                //       borderData: FlBorderData(show: true),
                //       lineBarsData: [
                //         LineChartBarData(
                //           spots: [
                //             FlSpot(0, 3),
                //             FlSpot(1, 1),
                //             FlSpot(2, 4),
                //             FlSpot(3, 2),
                //           ],
                //           isCurved: true,
                //           colors: [Colors.blue],
                //           belowBarData: BarAreaData(show: false),
                //         ),
                //       ],
                //     ),
                //     swapAnimationDuration: Duration(milliseconds: 150),
                //     swapAnimationCurve: Curves.linear,
                //   ),
                // ),
                ExpensesCard(
                    item: "Transport",
                    itemDetails: "Transaction to work",
                    price: 30.00,
                    date: "Feb 29"),
                SizedBox(
                  height: 40.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
