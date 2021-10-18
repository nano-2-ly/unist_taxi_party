import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:unist_taxt_party_app/models/party.dart';

class PartyListItemWidget extends StatelessWidget {
  final Party partyItem;

  const PartyListItemWidget({Key? key, required this.partyItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
          Get.toNamed('/');
        },
        title: Text(
          '${partyItem.departure} ➡ ${partyItem.arrival}',
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${partyItem.meetAt}',
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
