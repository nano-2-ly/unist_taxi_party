import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unist_taxt_party_app/models/joinedParty.dart';
import 'package:unist_taxt_party_app/models/party.dart';

class JoinedPartyWidget extends StatelessWidget {
  final JoinedParty joinedPartyInfo;

  const JoinedPartyWidget({Key? key, required this.joinedPartyInfo})
      : super(key: key);

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
                  borderRadius: new BorderRadius.all(Radius.circular(20.0))),
              child: Stack(
                children: [
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                        width: 30,
                        height: 30,
                        decoration: new BoxDecoration(
                            color: Colors.black12,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(30.0)))),
                  ),
                  Positioned(right: 8, top: 8, child: Icon(Icons.add_alert))
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            FutureBuilder(
                future: getPartyByUUID(joinedPartyInfo.partyUUID),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                  if (snapshot.hasData == false) {
                    return CircularProgressIndicator();
                  }
                  //error가 발생하게 될 경우 반환하게 되는 부분
                  else if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  }
                  // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                  else {
                    print(" text : ");
                    print(snapshot.data["arrival"]);
                    return Text(
                      "${snapshot.data["departure"]} ▶ ${snapshot.data["arrival"]}",
                      style: TextStyle(fontSize: 14),
                    );
                  }
                }),
          ],
        ));
  }
}

Future<dynamic> getPartyByUUID(String UUID) async {
  try {
    String graphQLDocument = '''query MyQuery {
      getParty(id: "${UUID}") {
        arrival
        departure
      }
    }''';

    var operation = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: graphQLDocument,
    ));

    var response = await operation.response;
    Map data = jsonDecode(response.data);

    dynamic party = data['getParty'];
    return party;
  } on ApiException catch (e) {
    print('Query failed: $e');
    return "";
  }
}
