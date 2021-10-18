import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unist_taxt_party_app/models/party.dart';
import 'package:unist_taxt_party_app/widgets/chatLog.dart';
import 'package:unist_taxt_party_app/widgets/sendChat.dart';

class PartyScreen extends StatelessWidget {
  const PartyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Party"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: ChatLogWidget()),
            SendChatWidget(),
          ],
        ),
      ),
    );
  }
}
