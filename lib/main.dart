import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'Auth_Screens/LoginOrRegister_Screen.dart';
import 'Controller/DependencyInjection_cotroller.dart';

void main() {

  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jesus House',
        theme: ThemeData.dark(),
      home: const LoginOrRegister()
    );
  }
}
