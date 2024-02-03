import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../Widgets/CustomTextFormField.dart';
import '../../constants/Colors.dart';
import '../MainPages/MainScreenHost.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool isLoading = false;

  @override
  void dispose() {
    _username.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "SignUp to use the App",
                    style: TextStyle(
                      color: darkBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormField(
                          obscureText: false,
                          controller: _username,
                          prefixIcon: Icon(Icons.person),
                          suffixIcon: null,
                          labelText: "username",
                          validator: (value) {
                            if (_username.text.isEmpty) {
                              return "Enter Username";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        CustomTextFormField(
                          obscureText: false,
                          controller: _phoneNumber,
                          prefixIcon: Icon(Icons.phone),
                          suffixIcon: null,
                          labelText: "Phone Number",
                          validator: (value) {
                            if (_phoneNumber.text.isEmpty) {
                              return "Enter Phone Number";
                            }
                            return null;
                          },
                        ),
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
                            message: 'Signing In...',
                            hideText: true,
                            radius: 1000.0,
                            width: 70,
                            height: 70);
                        Timer(Duration(seconds: 3), () {
                          // LoadingDialog.hide(context);
                          _dialog.hide();

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return MainScreenHost();
                              }));
                        });
                        //clear input fields value when the button is clicked
                        if (_formKey.currentState!.validate()) {
                          _username.text.trim();
                          _phoneNumber.text.trim();

                          // auth.loginUser(
                          //   _username.text.trim(),
                          //   _passwordController.text.trim(),
                          //   context,
                          // );
                          // Store username in LocalStorage
                          // LocalStorage storage = LocalStorage('username');
                          // storage.ready.then((_) {
                          //   final userName = _username.text.trim();
                          //   storage.setItem('username', userName);
                          // });
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
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
