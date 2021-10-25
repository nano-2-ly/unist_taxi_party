import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unist_taxt_party_app/models/party.dart';

class PartyCreateScreen extends StatelessWidget {
  const PartyCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("party create"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Text("출발지"),
                      ),
                      Container(
                        child: Text("Get.arguments.departure"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text("출발지"),
                      ),
                      Container(
                        child: Text("Get.arguments.arrival"),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Text("설명"),
                  ),
                  Container(
                    child: Text("Get.arguments.description"),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Text("모일 장소"),
                  ),
                  Container(
                    child: Text("Get.arguments.where"),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Text("모일 시각"),
                  ),
                  Container(
                    child: Text("Get.arguments.when"),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                onPressed: () async{
                  Party newParty = Party.fromJson(await createParty());
                  Get.offAndToNamed("/party", arguments: newParty);
                },
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: new BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: new BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Center(child: Text("생성하기", style: TextStyle(color: Colors.white),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Future<dynamic> createParty() async{
  try {
    String graphQLDocument = '''mutation createParty {
        createParty(input: {arrival: "구영리", departure: "유니스트", description: "버스정류장에서 출발할 분 구합니다. 천원만 내세요. 나머지는 제가 부담합니다. 빨리요.ㅠㅠ", users: "", when: "2021-10-26 14:00:00", where: "버스정류장"}) {
          id
        }
      }
    }''';

    var operation = Amplify.API.mutate(
        request: GraphQLRequest<String>(
          document: graphQLDocument,
        ));

    var response = await operation.response;
    Map data = jsonDecode(response.data);
    List<dynamic> userList  = data['createParty'];
    return  userList;
  } on ApiException catch (e) {
    print('Query failed: $e');
    return  <dynamic>[];
  }
}