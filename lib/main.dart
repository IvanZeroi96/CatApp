import 'package:catapp/model/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CatApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SFProMedium',
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.red,
        ),
      ),
      initialRoute: '/',
      getPages: routes,
    );
  }
}
