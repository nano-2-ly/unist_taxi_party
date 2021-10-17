import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

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

class MyApp extends StatelessWidget {
  // This widget is the root of your application.



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
      ],

    );
  }
}
