import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unist_taxt_party_app/models/party.dart';

class PartyJoinConfirmScreen extends StatelessWidget {
  const PartyJoinConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("join confirm"),
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
                        child: Text(Get.arguments.departure),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text("출발지"),
                      ),
                      Container(
                        child: Text(Get.arguments.arrival),
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
                    child: Text(Get.arguments.description),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Text("모일 장소"),
                  ),
                  Container(
                    child: Text(Get.arguments.meetLocation),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Text("모일 시각"),
                  ),
                  Container(
                    child: Text(Get.arguments.meetAt),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                onPressed: () {
                  Get.toNamed("/party", arguments: Get.arguments);
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
                  child: Center(child: Text("참여하기", style: TextStyle(color: Colors.white),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
