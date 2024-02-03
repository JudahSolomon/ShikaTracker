import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:lottie/lottie.dart';

import '../Login_and_Signup/SignUpScreen.dart';

class WalkThroughScreen extends StatelessWidget {
  const WalkThroughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: SafeArea(
        child: OnBoardingSlider(
          imageVerticalOffset: 30.0,
          onFinish: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return SignUpScreen();
            }));
          },
          headerBackgroundColor: Colors.white,
          finishButtonText: 'Get Started',
          addButton: true,
          indicatorPosition: 1,
          indicatorAbove: true,
          hasSkip: true,
          skipIcon: Icon(Icons.arrow_circle_right),
          hasFloatingButton: true,
          finishButtonStyle: const FinishButtonStyle(
            backgroundColor: Colors.lightBlue,
          ),
          background: [
            Center(
              child: Lottie.asset('assets/animation/start_lottoe.json',
                  // Path to your animation file
                  height: 300,
                  width: 400),
            ),
            Center(
              child: Lottie.asset('assets/animation/registration_lottie.json',
                  // Path to your animation file
                  height: 300,
                  width: 400),
            ),
            Center(
              child: Lottie.asset('assets/animation/money_lottie.json',
                  // Path to your animation file
                  height: 300,
                  width: 400),
            ),
            Center(
              child: Lottie.asset('assets/animation/finished_lottie.json',
                  // Path to your animation file
                  height: 300,
                  width: 400),
            ),
          ],
          totalPage: 4,
          speed: 1.5,
          pageBodies: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: const Column(
                children: <Widget>[
                  SizedBox(
                    height: 350,
                  ),
                  Text('Welcome',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Your all-in-one solution for mastering your finances. "
                    "Get ready to effortlessly track expenses, boost savings, "
                    "and achieve financial goals. Let's dive in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: const Column(
                children: <Widget>[
                  SizedBox(
                    height: 350,
                  ),
                  Text(' Monitor CashFlow',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Seamlessly manage income, monitor expenses,"
                    " and optimize your cash flow. Experience financial"
                    " clarity and control at your fingertips",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: const Column(
                children: <Widget>[
                  SizedBox(
                    height: 350,
                  ),
                  Text('CashFlow Graph Overview ',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    " Visualize your financial journey with our "
                        "intuitive cash flow graphs. Watch as your "
                        "income and expenses come to life,"
                        " providing you with a clear snapshot of "
                        "your financial health at a glance",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: const Column(
                children: <Widget>[
                  SizedBox(
                    height: 350,
                  ),
                  Text('You Are All Set',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Congratulations! Sign up and "
                    " effortlessly monitor your finances,"
                    " make informed decisions, and watch your "
                    "financial goals become a reality.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
