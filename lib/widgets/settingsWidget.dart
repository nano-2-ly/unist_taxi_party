import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:unist_taxt_party_app/controller/joinedPartyController.dart';
import 'package:unist_taxt_party_app/models/party.dart';
import 'package:unist_taxt_party_app/widgets/hotSpot.dart';
import 'package:unist_taxt_party_app/widgets/joinedPartyWidget.dart';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          child: Icon(
            Icons.face,
            size: 20,
          ),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
        ),
        Text(
          "나른한수달7781",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text("내 이름은 수달, 나른하죠."),
        Container(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("알림"),
              Switch(
                value: true,
                onChanged: (value) {},
                activeTrackColor: Colors.yellow,
                activeColor: Colors.orangeAccent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
