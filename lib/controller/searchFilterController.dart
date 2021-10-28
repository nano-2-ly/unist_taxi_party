import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFilterController extends GetxController {
  final departureFilterTextController = TextEditingController();
  final arrivalFilterTextController = TextEditingController();

  var departureFilterText = "".obs;
  var arrivalFilterText = "".obs;

  void changeDepartureTextValue() {
    print("hello.???");
    departureFilterText.value = departureFilterTextController.text;
  }

  void changeArrivalTextValue() {
    arrivalFilterText.value = arrivalFilterTextController.text;
  }
}
