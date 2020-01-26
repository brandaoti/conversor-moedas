import 'package:conversor_moedas/ui/android/pages/home_page.dart';
import 'package:flutter/material.dart';

class MyMaterialApp extends StatelessWidget{
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Conversor de moedas",
      theme: ThemeData(primaryColor: Colors.green),
      home: HomePage(),
    );
  }
}