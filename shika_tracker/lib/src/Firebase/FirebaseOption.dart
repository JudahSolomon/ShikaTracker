import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

FirebaseOptions firebaseOptions = Platform.isAndroid
    // use this configuration for Android
    ? const FirebaseOptions(
        apiKey: "AIzaSyDi1nu5e7rXZSt6nOjVOb_Qwj9Q0ohA2C8",
        appId: "1:901508584265:android:dc6c949f72d10a12dfc098",
        messagingSenderId: "901508584265",
        projectId: "shikatracker-396d3")
    //  use this configuration for ios
    : const FirebaseOptions(
        apiKey: "AIzaSyDv7M-eFsiqAI4cHOJGPva-i9LBC2l79ps",
        appId: "com.example.shikaTracker",
        messagingSenderId: "901508584265",
        projectId: "shikatracker-396d3");
