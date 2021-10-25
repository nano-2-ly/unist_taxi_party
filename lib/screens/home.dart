import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:get/get.dart';
import 'package:unist_taxt_party_app/controller/authDataController.dart';
import 'package:unist_taxt_party_app/screens/party_create.dart';
import 'package:unist_taxt_party_app/widgets/bottomBar.dart';
import 'package:unist_taxt_party_app/widgets/overview.dart';
import 'package:unist_taxt_party_app/widgets/search.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthUser? _user;
  @override
  var controller = Get.put(AuthDataController());
  void initState() {
    super.initState();

    if(Amplify.Auth.getCurrentUser().isBlank!){
      Get.toNamed('/entry');
    }else{
      Amplify.Auth.getCurrentUser().then((user) {

        setState(() {
          _user = user;
          controller.authData.value = user;
        });
      }).catchError((error) {
        print((error as AuthException).message);
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async{
              Get.toNamed('/party-create');
              await createPartyGQL();
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.deepPurple,
          ),
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            MaterialButton(
              onPressed: () {
                Amplify.Auth.signOut().then((_) {
                  Get.toNamed('/entry');

                });
              },
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children:[
            Overview(),
            SeachWidget(),
            Container(),
          ],
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}

Future<dynamic> createPartyGQL() async{
  String graphQLDocument = '''mutation createParty {
    createParty(input: {arrival: "구영리",
      departure: "유니스트", 
      description: "버스정류장에서 출발할 분 구합니다. 천원만 내세요. 나머지는 제가 부담합니다. 빨리요.ㅠㅠ", 
      users: [""], 
      when: "2021-10-26 14:00:00", 
      where: "버스정류장"}) {
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
    "arrival": "구영리",
    "departure": "유니스트",
    "description": "버스정류장에서 출발할 분 구합니다. 천원만 내세요. 나머지는 제가 부담합니다. 빨리요.ㅠㅠ",
    "users": [""],
    "when": "2021-10-26 14:00:00",
    "where": "버스정류장",
  };

  var operation = Amplify.API.mutate(
      request: GraphQLRequest<String>(
        document: graphQLDocument,
        variables: variables
      ));

  var response = await operation.response;
  Map data = jsonDecode(response.data);
  var userList  = data['createParty'];
  return  userList;
}