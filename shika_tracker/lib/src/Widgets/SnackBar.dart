import 'package:flutter/material.dart';

class SnackBar extends StatefulWidget {
  const SnackBar(
      {Key? key,
      required double elevation,
      required MaterialAccentColor backgroundColor,
      required Text content,
      required Duration duration,
      required EdgeInsets padding,
      required SnackBarAction action});

  @override
  State<SnackBar> createState() => _SnackBarState();
}

class _SnackBarState extends State<SnackBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SnackBar(
        elevation: 10.0,
        backgroundColor: Colors.blueAccent,
        padding: EdgeInsets.fromLTRB(50, 0, 50, 50),
        content: Text('Signing In...'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            // Perform any action when the user presses the action button
          },
        ),
      ),
    );
  }
}
