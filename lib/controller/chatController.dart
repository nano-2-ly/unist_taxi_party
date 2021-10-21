
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:unist_taxt_party_app/controller/chatScrollController.dart';
import 'package:unist_taxt_party_app/controller/partyController.dart';

import 'DBcontroller.dart';

class ChatController extends GetxController{

  RxList<dynamic> chatList = <dynamic>[].obs;




  void addChat(chatItem){
    final chatScrollController = Get.put(ChatScrollController());
    chatList.add(chatItem);

    if(chatScrollController.chatAlwaysFocusToBottom.value == true){
      Future.delayed(const Duration(milliseconds: 100), () {
        chatScrollController.focusToBottom();
      });
    }

  }

  void loadChat(partyUUID)async{
    final partyController = Get.put(PartyController());
    final chatScrollController = Get.put(ChatScrollController());
    chatList.value = await readDB(partyController.party.value.partyUUID);

    Future.delayed(const Duration(milliseconds: 100), () {
      chatScrollController.focusToBottom();
    });

  }
}