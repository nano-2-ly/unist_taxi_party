import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:unist_taxt_party_app/controller/DBcontroller.dart';
import 'package:unist_taxt_party_app/controller/authDataController.dart';
import 'package:unist_taxt_party_app/controller/chatController.dart';
import 'package:unist_taxt_party_app/controller/chatScrollController.dart';
import 'package:unist_taxt_party_app/controller/partyController.dart';
import 'package:unist_taxt_party_app/models/party.dart';
import 'package:unist_taxt_party_app/widgets/partyListItem.dart';
import 'package:http/http.dart' as http;


class SendChatWidget extends StatelessWidget {
  const SendChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var partyController = Get.put(PartyController());
    final chatScrollController = Get.put(ChatScrollController());
    return Container(
      color: Colors.deepPurple,
      height: 50,
      width: double.infinity,
      child: Center(
        child: Row(
          children: [
            FlatButton(
              onPressed: () {
                makePushNotification();
                readDB(partyController.party.value.partyUUID);
              },
              child: Text("chat area"),
            ),

            FlatButton(
              onPressed: () {
                makePushNotification2();
                readDB(partyController.party.value.partyUUID);
              },
              child: Text("chat area"),
            ),
          ],
        ),
      ),
    );
  }

  void makePushNotification() async{
    var partyController = Get.put(PartyController());

    print("send");
    var url = Uri.parse("https://userserver.bighornapi.com/lambda/pushNotification");

    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body:  jsonEncode(
          <String, String>{
            'code':partyController.party.value.partyUUID,
            "content":"{\"chatUUID\":\"${partyController.party.value.partyUUID}\", \"partyUUID\":\"${partyController.party.value.partyUUID}\",\"uid\":\"G-123\",\"createAt\":\"${DateTime.now()}\",\"content\":\"hello\"}",
          }
      ),
    );

    print(response.body);
  }

  void makePushNotification2() async{
    var authController = Get.put(AuthDataController());
    var partyController = Get.put(PartyController());

    print("send");
    var url = Uri.parse("https://userserver.bighornapi.com/lambda/pushNotification");

    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body:  jsonEncode(
          <String, String>{
            'code':partyController.party.value.partyUUID,
            "content":"{\"chatUUID\":\"${partyController.party.value.partyUUID}\", \"partyUUID\":\"${partyController.party.value.partyUUID}\",\"uid\":\"${authController.authData.value.username}\",\"createAt\":\"${DateTime.now()}\",\"content\":\"hello\"}",
          }
      ),
    );

    print(response.body);
  }
}
