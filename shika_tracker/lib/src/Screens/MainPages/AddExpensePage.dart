import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rydex_driver_app/src/Screens/MainPages/MainScreenHost.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../Widgets/CustomTextFormField.dart';
import '../../constants/Colors.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _item = TextEditingController();
  final TextEditingController _itemDetails = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _date = TextEditingController();

  Future<void> _saveExpense() async {
    // Getting the destination of the json file
    Directory directory = await getApplicationDocumentsDirectory();
    io.File file = io.File('${directory.path}/cashFlowData.json');

    // Reading existing data from cashFlowData.json
    String jsonString = await file.readAsString();
    List<dynamic> jsonData = json.decode(jsonString);

    // Create a new expense entry
    Map<String, dynamic> newExpense = {
      "item": _item.text,
      "itemDetails": _itemDetails.text,
      "price": double.parse(_price.text),
      "date": DateFormat.yMMMd().format(DateTime.now()),
      // Automatically add the current date
    };
    // Add the new expense to the existing data
    jsonData.add(newExpense);
    // Write the updated data back to cashFlowData.json
    await file.writeAsString(json.encode(jsonData));
    // Pop the current screen
    Navigator.pop(context);
  }

  final List<String> items = [
    'Inflow',
    'Expenses',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "select CashFlow",
                  style: TextStyle(
                    color: darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: const Text(
                            'Select Item',
                            style: TextStyle(
                              fontFamily: 'RobotoBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          items: items
                              .map((String item) => DropdownMenuItem<String>(

                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            elevation: 5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),

                              ),

                            ),
                            padding: EdgeInsets.symmetric(horizontal: 100),
                            height: 40,
                            width: double.infinity,

                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,

                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      CustomTextFormField(
                        obscureText: false,
                        controller: _item,
                        prefixIcon: Icon(
                          Icons.add_shopping_cart_outlined,
                        ),
                        suffixIcon: null,
                        labelText: "Item",
                        validator: (value) {
                          if (_item.text.isEmpty) {
                            return "Enter Item Name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      CustomTextFormField(
                        obscureText: false,
                        controller: _itemDetails,
                        prefixIcon: Icon(Icons.description),
                        suffixIcon: null,
                        labelText: "Item Details",
                        validator: (value) {
                          if (_itemDetails.text.isEmpty) {
                            return "Add Item Details";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      CustomTextFormField(
                        obscureText: false,
                        controller: _price,
                        prefixIcon: Icon(Icons.price_change_outlined),
                        suffixIcon: null,
                        labelText: " Price",
                        validator: (value) {
                          if (_date.text.isEmpty) {
                            return "Add Amount ";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      SimpleFontelicoProgressDialog _dialog =
                          SimpleFontelicoProgressDialog(context: context);
                      _dialog.show(
                          indicatorColor: Colors.blue,
                          elevation: 3,
                          type: SimpleFontelicoProgressDialogType.normal,
                          message: 'Adding Item...',
                          hideText: true,
                          radius: 1000.0,
                          width: 70,
                          height: 70);
                      Timer(Duration(seconds: 3), () {
                        _dialog.hide();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreenHost()),
                        );
                      });
                      //clear input fields value when the button is clicked
                      if (_formKey.currentState!.validate()) {
                        _item.text.trim();
                        _itemDetails.text.trim();
                        _price.text.trim();
                        _date.text.trim();

                        AnimatedSnackBar.rectangle(
                          desktopSnackBarPosition:
                              DesktopSnackBarPosition.bottomCenter,
                          'Success',
                          "_resMessage",
                          mobileSnackBarPosition: MobileSnackBarPosition.top,
                          type: AnimatedSnackBarType.success,
                          brightness: Brightness.light,
                          duration: Duration(microseconds: 5),
                        ).show(
                          context,
                        );
                      }
                      ;
                    },
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        primary: Colors.deepPurple,
                        onPrimary: Colors.black87,
                        elevation: 15,
                        shadowColor: Colors.black38,
                        shape: RoundedRectangleBorder(
                            // side: BorderSide(width: 1.0, color: borderColor),
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "Add Cashflow",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
