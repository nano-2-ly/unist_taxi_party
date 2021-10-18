import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:unist_taxt_party_app/models/chat.dart';
import 'package:unist_taxt_party_app/models/party.dart';
import 'package:unist_taxt_party_app/widgets/chatListItem.dart';
import 'package:unist_taxt_party_app/widgets/partyListItem.dart';

class ChatLogWidget extends StatelessWidget {
  const ChatLogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

        child: ListView(
          children: [
            ChatListItemWidget(chatItem: Chat("0001","partyUUID","uid", "createAt","content"),),
            ChatListItemWidget(chatItem: Chat("0001","partyUUID","uid", "createAt","content"),),

          ],
        )
    );
  }
}
