
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:unist_taxt_party_app/controller/partyController.dart';

import 'DBcontroller.dart';

class ChatController extends GetxController{

  RxList<dynamic> chatList = <dynamic>[].obs;


  void addChat(chatItem){

    chatList.add(chatItem);
    print(chatList);
  }

  void loadChat(partyUUID)async{
    final partyController = Get.put(PartyController());
    chatList.value = await readDB(partyController.party.value.partyUUID);
  }
}