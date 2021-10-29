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
import 'package:unist_taxt_party_app/widgets/settingsWidget.dart';

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

    if (Amplify.Auth.getCurrentUser().isBlank!) {
      Get.toNamed('/entry');
    } else {
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
          onPressed: () async {
            Get.toNamed('/party-create');
            // await createPartyGQL();
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
          children: [
            Overview(),
            SeachWidget(),
            SettingsWidget(),
          ],
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
