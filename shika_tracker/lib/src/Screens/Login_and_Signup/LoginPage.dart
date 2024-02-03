import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
    Text("Login to Use this App")
        ],
    )

    );
  }
}
