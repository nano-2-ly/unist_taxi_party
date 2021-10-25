import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:unist_taxt_party_app/models/party.dart';
import 'package:unist_taxt_party_app/widgets/hotSpot.dart';

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: ListView(
        scrollDirection:Axis.horizontal,
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: HotSpot(partyInfo: Party("a","a","울산역KTX","a","a","a","a","a","a",[]),)),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: HotSpot(partyInfo: Party("a","a","구영리","a","a","a","a","a","a",[]),)),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: HotSpot(partyInfo: Party("a","a","천상리","a","a","a","a","a","a",[]),)),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: HotSpot(partyInfo: Party("a","a","울산대","a","a","a","a","a","a",[]),)),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: HotSpot(partyInfo: Party("a","a","울산공항","a","a","a","a","a","a",[]),)),
        ],
      )
    );
  }
}
