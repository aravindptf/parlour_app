import 'package:flutter/material.dart';
import 'package:parlour_app/homepage.dart';
import 'package:parlour_app/login%20page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      home: LoginPage(),
    );
  }
}

 

