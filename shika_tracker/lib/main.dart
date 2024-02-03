import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rydex_driver_app/src/Firebase/FirebaseOption.dart';
import 'package:rydex_driver_app/src/Screens/MainPages/MainScreenHost.dart';
import 'package:rydex_driver_app/src/controller/HomeController.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initializing Firebase

  Firebase.initializeApp(options: firebaseOptions);
  // registering GetX controller
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreenHost(),

    );
  }
}
