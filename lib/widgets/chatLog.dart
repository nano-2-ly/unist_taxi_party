import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:unist_taxt_party_app/controller/DBcontroller.dart';
import 'package:unist_taxt_party_app/controller/chatController.dart';
import 'package:unist_taxt_party_app/controller/chatScrollController.dart';
import 'package:unist_taxt_party_app/controller/partyController.dart';
import 'package:unist_taxt_party_app/models/chat.dart';
import 'package:unist_taxt_party_app/models/party.dart';
import 'package:unist_taxt_party_app/widgets/chatListItem.dart';
import 'package:unist_taxt_party_app/widgets/partyListItem.dart';

class ChatLogWidget extends StatelessWidget {
  const ChatLogWidget({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());
    final partyController = Get.put(PartyController());
    final chatScrollController = Get.put(ChatScrollController());

    // controller.chatList.value =  readDB(partyController.party.value.partyUUID);
    controller.chatList.value=[];
    controller.loadChat(partyController.party.value.partyUUID);

    return Container(

        child: Obx(()=>ListView.builder(
          controller: chatScrollController.scrollController.value,
          padding: const EdgeInsets.all(8),
          itemCount: controller.chatList.length ,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) return Container();
            return ChatListItemWidget(chatItem:controller.chatList.value[index]);
          },
        ))
    );
  }
}

