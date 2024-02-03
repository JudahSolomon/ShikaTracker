import 'package:flutter/material.dart';

import '../constants/Colors.dart';

class CashFlow extends StatefulWidget {
  final String cashFlow;
  final String amount;
  final Color backgroundColor;

  const CashFlow({
    super.key,
    required this.cashFlow,
    required this.amount,
    required this.backgroundColor,
  });

  @override
  State<CashFlow> createState() => _CashFlowState();
}

class _CashFlowState extends State<CashFlow> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset.zero,
                        blurRadius: 10,
                        spreadRadius: 4)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.cashFlow,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: white,
                                        fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10.01,
                              ),
                              Text(
                                widget.amount.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: white,
                                        fontWeight: FontWeight.w700,
                                fontSize: 24.0),
                              ),
                              Container(height: 10),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.stacked_line_chart,
                          size: 20.0,
                          color: white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
