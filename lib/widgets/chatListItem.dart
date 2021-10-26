import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:unist_taxt_party_app/controller/authDataController.dart';
import 'package:unist_taxt_party_app/models/chat.dart';
import 'package:unist_taxt_party_app/models/party.dart';



class ChatListItemWidget extends StatelessWidget {
  final Chat chatItem;

  const ChatListItemWidget({Key? key, required this.chatItem}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    var controller = Get.put(AuthDataController());
    print(controller.authData.value.username);
    return Container(
      padding: (chatItem.uid != controller.authData.value.username)?EdgeInsets.fromLTRB(0, 0, 100, 0):EdgeInsets.fromLTRB(100, 0, 0, 0),
      child: Card(
        child: ListTile(
          title: Text(
            '${chatItem.content}',
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            '${chatItem.createAt}',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
