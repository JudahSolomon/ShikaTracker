import 'package:flutter/material.dart';
import 'package:rydex_driver_app/src/controller/HomeController.dart';

import '../../Widgets/CashFlow.dart';
import '../../Widgets/ExpensesCard.dart';
import 'package:get/get.dart';
import '../../constants/Colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Map<String, dynamic>>>? _expensesData;

  @override
  void initState() {
    super.initState();
    _expensesData = fetchExpenseData();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<HomeController>(builder: (ctlr) {
          return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Image.asset(
                                'assets/icons/user_profile.png',
                                width: 40.0,
                                height: 40.0,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 100, 8.0),
                              child: Text(
                                "Total Balance",
                              ),
                            ),
                            Image.asset(
                              'assets/icons/notification_bell.png',
                              width: 30.0,
                              height: 30.0,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("\$4,5784.00",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                      color: black,
                                      fontWeight: FontWeight.w900)),
                              Text("Total Balance",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                      color: grey,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: CashFlow(
                                  cashFlow: "Income",
                                  amount: "\$ 3,495.00",
                                  backgroundColor: green,
                                )),
                            SizedBox(
                                width: 20.0
                            ),
                            Expanded(
                                child: CashFlow(
                                    cashFlow: "Expenses",
                                    amount: "\$ 2,457.00",
                                    backgroundColor: red)),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                              "Recent Transactions "
                                  "${ctlr.testMethod(" Testing GetX Library")}",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                  color: grey, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Today",
                            style: TextStyle(
                              fontFamily: 'RobotoBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      FutureBuilder<List<Map<String, dynamic>>>(
                        future: _expensesData,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            List<Map<String, dynamic>> expenses = snapshot
                                .data!;
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: expenses.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> expense = expenses[index];
                                return ExpensesCard.fromJson(expense);
                              },
                            );
                          }
                        },
                      ),
                      const ExpensesCard(
                          item: "Transport",
                          itemDetails: "Transaction to work",
                          price: 30.00,
                          date: "Feb 29"),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "last week",
                            style: TextStyle(
                              fontFamily: 'RobotoBold',
                              fontWeight: FontWeight.normal,
                              color: grey,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40.0,
                      )
                    ],
                  ),
                ),
              ));
        }));
  }
}
