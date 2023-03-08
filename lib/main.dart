import 'package:currency_rate_challange/pages/main_page.dart';
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
      title: 'Live Currency Rate App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Satoshi",
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/":(ctx)=> MainPage()
      },
    );
  }
}
