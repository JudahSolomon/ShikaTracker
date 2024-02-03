import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // initializing FireStore
  late FirebaseFirestore _firestore;
  late final CollectionReference expenses;
  late final CollectionReference inflows;
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  String test = " Testing GetX Library";

  @override
  void onInit() {
    // TODO: implement onInit
    _firestore = FirebaseFirestore.instance;
    expenses = _firestore.collection('expenses');
    inflows = _firestore.collection('income');
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  testMethod(String text) {
    if (kDebugMode) {
      print(text);
    }
  }
}
