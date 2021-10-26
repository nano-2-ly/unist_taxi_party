import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unist_taxt_party_app/controller/authDataController.dart';
import 'package:unist_taxt_party_app/models/party.dart';

class PartyCreateScreen extends StatelessWidget {
  const PartyCreateScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var authController = Get.put(AuthDataController());

    final departureController = TextEditingController();
    final arrivalController = TextEditingController();
    final descriptionController = TextEditingController();
    final whereController = TextEditingController();
    final whenController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("party create"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    child: Text("출발지"),
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      controller: departureController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '출발지',
                        )
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Text("도착지"),
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      controller: arrivalController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '도착지',
                        )
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Text("설명"),
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      controller: descriptionController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '설명',
                        )
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Text("모일 장소"),
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      controller: whereController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '모일 장소',
                        )
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Text("모일 시각"),
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      controller: whenController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '모일 시각',
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                onPressed: () async{
                  Party newParty = Party.fromJson(await createPartyGQL(
                    arrivalController.text,
                    departureController.text,
                    descriptionController.text,
                    [authController.authData.value.username],
                    whenController.text,
                    whereController.text
                  ));
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


Future<dynamic> createPartyGQL(
    arrival,
    departure,
    description,
    users,
    when,
    where
    ) async{
  String graphQLDocument = '''mutation createParty(\$arrival: String!, \$departure: String!, \$description: String!, \$users: [String]!, \$when: String!, \$where: String!){
    createParty(input: {arrival: \$arrival,
      departure: \$departure, 
      description: \$description, 
      users: \$users, 
      when: \$when, 
      where: \$where}) {
      id
      arrival
      createdAt
      departure
      description
      updatedAt
      users
      when
      where
    }
  }''';

  var variables = {
    "arrival": arrival,
    "departure": departure,
    "description": description,
    "users": users,
    "when": when,
    "where": where,
  };

  var operation = Amplify.API.mutate(
      request: GraphQLRequest<String>(
          document: graphQLDocument,
          variables: variables
      )
  );

  var response = await operation.response;
  print(response);
  Map data = jsonDecode(response.data);
  var userList  = data['createParty'];
  return  userList;
}