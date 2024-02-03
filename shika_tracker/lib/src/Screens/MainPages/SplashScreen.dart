import 'dart:async';

import 'package:flutter/material.dart';

import '../../constants/Colors.dart';
import '../OnBoarding/WalkThroughScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WalkThroughScreen()));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: 400.0,
            color: Colors.lightBlue,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("ShikaTracker", style: TextStyle(
                  fontSize: 36.0, color: white,
                  fontWeight: FontWeight.bold
                ),),
                Text("Track Every Penny, Shape Your Financial Destiny",style: TextStyle(
                    fontSize: 16.0, color: white
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
