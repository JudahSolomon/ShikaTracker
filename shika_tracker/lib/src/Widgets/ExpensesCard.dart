import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/Colors.dart';

class ExpensesCard extends StatefulWidget {
  final String item;
  final String itemDetails;
  final double price;
  final String date;

  const ExpensesCard({
    Key? key,
    required this.item,
    required this.itemDetails,
    required this.price,
    required this.date,
  }) : super(key: key);

  //
  factory ExpensesCard.fromJson(Map<String, dynamic> json) {
    return ExpensesCard(
      item: json['item'],
      itemDetails: json['itemDetails'],
      price: json['price'].toDouble(),
      date: json['date'],
    );
  }

  @override
  State<ExpensesCard> createState() => _ExpensesCardState();
}

// creating a function that load loads the JSON file from the specified asset path
Future<List<Map<String, dynamic>>> fetchExpenseData() async {
  try {
    // Load the JSON file
    const String assetPath = 'lib/src/data/cashFlowData.json';
    final String jsonString = await rootBundle.loadString(assetPath);
    // Parse the JSON string into a List<Map<String, dynamic>>
    final List<dynamic> jsonData = json.decode(jsonString);
    // Optionally, if your data is a list of maps, you can cast it like this:
    final List<Map<String, dynamic>> expensesData =
        List<Map<String, dynamic>>.from(jsonData);
    return expensesData;
  } catch (e) {
    // Handle the exception
    print('Error loading JSON: $e');
    return [];
  }
}

// create a color generation function to
// generate random colors foe the icon bg
// Color getRandonColors(){
//   return Color
// }

@override
State<ExpensesCard> createState() => _ExpensesCardState();

class _ExpensesCardState extends State<ExpensesCard> {
  @override
  Widget build(BuildContext context) {
    String iconName;
    Color priceColor;

    // Selecting icon based on the text for the item
    switch (widget.item.toLowerCase()) {
      case 'groceries':
        iconName = "grocery2.png";
        break;
      case 'rent':
        iconName = "rent_2.png";
        break;
      case 'shoes':
        iconName = "sneakers_2.png";
        break;
      case 'transport':
        iconName = "transportation.png";
        break;
      case 'gig':
        iconName = "side_hustle1.png";
        break;
      // Add more cases for other items as needed
      default:
        iconName = "box.png"; // Default icon
    }
    // Setting text color based on whether the amount is positive or negative
    priceColor = widget.price >= 0 ? green : red;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset.zero,
                  blurRadius: 10,
                  spreadRadius: 4)
            ]),
        child:  ListTile(
          leading: Image.asset(
            'assets/icons/$iconName',
            width: 35.0,
            height: 35.0,
          ),
          title: Text(
            widget.item,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: darkBlue, fontWeight: FontWeight.w600,
                fontSize: 16.0
              )
          ),
          subtitle: Text(
            widget.itemDetails,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: grey, fontWeight: FontWeight.w400
              )
          ),
          trailing: Column(children: [
            Text(
          '\$${widget.price}',
              // Assuming price is a double
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: priceColor, fontWeight: FontWeight.w700,
                  fontSize: 18.0
                )
            ),
            Text(
              widget.date,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: grey, fontWeight: FontWeight.w300,
                    fontSize: 14.0
                )
            ),
          ]),
        ),
      ),
    );
  }
}
