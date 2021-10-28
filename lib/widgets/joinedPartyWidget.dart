import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unist_taxt_party_app/models/joinedParty.dart';
import 'package:unist_taxt_party_app/models/party.dart';

class JoinedPartyWidget extends StatelessWidget {

  final JoinedParty joinedPartyInfo;

  const JoinedPartyWidget({Key? key, required this.joinedPartyInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        width: 110,
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 110,
                height: 110,
                decoration: new BoxDecoration(
                    color: Colors.black12,
                    borderRadius: new BorderRadius.all(Radius.circular(20.0))
                ),
              child: Stack(
                children: [
                Positioned(
                  right:5,
                  top:5,
                  child: Container(
                  width: 30,
                  height: 30,
                  decoration: new BoxDecoration(
                      color: Colors.black12,
                      borderRadius: new BorderRadius.all(Radius.circular(30.0)))),
                ),

                  Positioned(
                      right:8,
                      top:8,
                      child: Icon(Icons.add_alert))
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "${joinedPartyInfo.partyUUID}",
              style: TextStyle(fontSize: 14),
            ),

          ],
        ));
  }
}
