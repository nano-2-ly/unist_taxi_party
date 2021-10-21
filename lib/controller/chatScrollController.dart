import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScrollController extends GetxController {
  final scrollController = ScrollController().obs;
  final chatAlwaysFocusToBottom = false.obs;



  void focusToBottom(){
    scrollController.value.jumpTo(scrollController.value.position.maxScrollExtent);
    print(":D");
  }
}