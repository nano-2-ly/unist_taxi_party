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

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final joinedPartyController = Get.put(JoinedPartyController());
    return Column(
      children: [
        Container(
            height: 200,
            padding: EdgeInsets.all(8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: HotSpot(
                      partyInfo: Party(
                          "a", "a", "울산역KTX", "a", "a", "a", "a", "a", "a", []),
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: HotSpot(
                      partyInfo: Party(
                          "a", "a", "구영리", "a", "a", "a", "a", "a", "a", []),
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: HotSpot(
                      partyInfo: Party(
                          "a", "a", "천상리", "a", "a", "a", "a", "a", "a", []),
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: HotSpot(
                      partyInfo: Party(
                          "a", "a", "울산대", "a", "a", "a", "a", "a", "a", []),
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: HotSpot(
                      partyInfo: Party(
                          "a", "a", "울산공항", "a", "a", "a", "a", "a", "a", []),
                    )),
              ],
            )),
        Obx(
          () => Container(
              height: 200,
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemCount: joinedPartyController.joinedPartyList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: JoinedPartyWidget(
                          joinedPartyInfo: joinedPartyController
                              .joinedPartyList.value[index]));
                },
              )),
        )
      ],
    );
  }
}
