import 'dart:convert';

import 'package:amplify_flutter/amplify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:unist_taxt_party_app/screens/party.dart';
import 'package:unist_taxt_party_app/screens/party_create.dart';
import 'package:unist_taxt_party_app/screens/party_join_confirm.dart';

import 'controller/DBcontroller.dart';
import 'controller/chatController.dart';
import 'controller/chatScrollController.dart';
import 'controller/partyController.dart';
import 'models/chat.dart';
import 'models/party.dart';
import 'screens/entry.dart';
import 'screens/confirm.dart';
import 'screens/confirm_reset.dart';
import 'screens/home.dart';

import 'helpers/configure_amplify.dart';

import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  runApp(MyApp());

}


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    fcm_ready();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    _initNotiSetting();
    _initScrollControllerSetting();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '택시팟',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/entry', page: () => EntryScreen()),
        GetPage(name: '/confirm', page: () => ConfirmScreen()),
        GetPage(name: '/confirm-reset', page: () => ConfirmResetScreen()),
        GetPage(name: '/party-join-confirm', page: () => PartyJoinConfirmScreen()),
        GetPage(name: '/party', page: () => PartyScreen()),
        GetPage(name: '/party-create', page: () => PartyCreateScreen()),
      ],

    );
  }
}



void fcm_ready() async {
  final FirebaseApp _initialization = await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final controller = Get.put(ChatController());
  final partyController = Get.put(PartyController());

// use the returned token to send messages to users from your custom server

  print('FlutterFire Messaging Example: Subscribing to topic "1".');
  await FirebaseMessaging.instance.subscribeToTopic("0001");
  print('FlutterFire Messaging Example: Subscribing to topic "1" successful.');

  print('FlutterFire Messaging Example: Subscribing to topic "2".');
  await FirebaseMessaging.instance.subscribeToTopic("0002");
  print('FlutterFire Messaging Example: Subscribing to topic "2" successful.');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');

    if (message.notification != null) {
      print(
          'Message also contained a notification: ${jsonDecode(message.notification!.body!)["content"]}');

      Chat _chat = Chat.fromJson(jsonDecode(message.notification!.body!));
      print(_chat);


      writeDB(_chat);


      print("1");
      if(partyController.party.value.partyUUID != _chat.partyUUID) {
        print("2");
        _showNotification(message);
      }else{
        print("3");
        controller.addChat(_chat);

      }

    }


  });
}



Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
  Chat _chat = Chat.fromJson(jsonDecode(message.notification!.body!));
  writeDB(_chat);
}

void _initScrollControllerSetting() {
  final chatScrollontroller = Get.put(ChatScrollController());

  chatScrollontroller.scrollController.value.addListener(() {
    if (chatScrollontroller.scrollController.value.position.atEdge) {
      if (chatScrollontroller.scrollController.value.position.pixels == 0) {
        // You're at the top.
      } else {
        chatScrollontroller.chatAlwaysFocusToBottom.value = true;
      }
    }
    else{
      chatScrollontroller.chatAlwaysFocusToBottom.value = false;
    }
  });
}


void _initNotiSetting() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final initSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  final initSettingsIOS = IOSInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );
  final initSettings = InitializationSettings(
    android: initSettingsAndroid,
    iOS: initSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initSettings,
  );
}

Future<void> _showNotification(RemoteMessage message) async {
  var _flutterLocalNotificationsPlugin;

  var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/launcher_icon');
  var initializationSettingsIOS = IOSInitializationSettings();

  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  _flutterLocalNotificationsPlugin.initialize(initializationSettings);

  var android = AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      importance: Importance.max, priority: Priority.high);

  var ios = IOSNotificationDetails();
  var detail = NotificationDetails(android: android, iOS: ios);
  print(message);
  await _flutterLocalNotificationsPlugin.show(
    0,
    'notification',
    message.notification!.body.toString(),
    detail,
    payload: 'Hello Flutter',
  );
}
