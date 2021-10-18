import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:unist_taxt_party_app/models/party.dart';
import 'package:unist_taxt_party_app/widgets/partyListItem.dart';

class SeachWidget extends StatelessWidget {
  const SeachWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          children: [
            PartyListItemWidget(partyItem: Party("유니스트","울산역KTX","description","기숙사 광장","am 3:00","udpateAt","createAt","nanotoly",),),
            PartyListItemWidget(partyItem: Party("유니스트","울산역KTX","description","기숙사 광장","am 3:00","udpateAt","createAt","nanotoly",),),

          ],
        )
    );
  }
}
