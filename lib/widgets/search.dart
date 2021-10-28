import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:unist_taxt_party_app/controller/partyListController.dart';
import 'package:unist_taxt_party_app/controller/searchFilterController.dart';
import 'package:unist_taxt_party_app/models/party.dart';
import 'package:unist_taxt_party_app/widgets/partyListItem.dart';

class SeachWidget extends StatelessWidget {
  const SeachWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchFileterController = Get.put(SearchFilterController());

    searchFileterController.arrivalFilterTextController
        .addListener(searchFileterController.changeArrivalTextValue);

    searchFileterController.departureFilterTextController
        .addListener(searchFileterController.changeDepartureTextValue);

    return Obx(() => Container(
            child: Column(
          children: [
            searchFilterArea(),
            Expanded(
                child: partyList(
                    searchFileterController.departureFilterText.value,
                    searchFileterController.arrivalFilterText.value)),
          ],
        )));
  }
}

Widget searchFilterArea() {
  final searchFileterController = Get.put(SearchFilterController());
  return Container(
    child: Column(
      children: [
        Container(
          width: 300,
          child: TextField(
              controller: searchFileterController.departureFilterTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '출발지',
              )),
        ),
        Container(
          width: 300,
          child: TextField(
              controller: searchFileterController.arrivalFilterTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '도착지',
              )),
        ),
      ],
    ),
  );
}

Widget partyList(dynamic departure, dynamic arrival) {
  return Container(
      child: FutureBuilder(
          future: getParty(departure, arrival),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
            if (snapshot.hasData == false) {
              return Center(child: CircularProgressIndicator());
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
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PartyListItemWidget(
                          partyItem: Party.fromJson(snapshot.data[index]));
                    },
                  ));
            }
          }));
}

Future<List<dynamic>> getParty(String departure, String arrival) async {
  Get.put(PartyListController());
  try {
    String graphQLDocument = '''query GetPartyList {
      listParties (filter: {departure: {contains: "${departure}"},arrival: {contains: "${arrival}"},}) {
        items {
          id
          updatedAt
          when
          users
          where
          description
          departure
          createdAt
          arrival
        }
      }
    }''';

    var operation = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: graphQLDocument,
    ));

    var response = await operation.response;
    Map data = jsonDecode(response.data);

    List<dynamic> userList = data['listParties']["items"];
    return userList;
  } on ApiException catch (e) {
    print('Query failed: $e');
    return [];
  }
}
