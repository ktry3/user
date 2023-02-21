import 'package:finalprojectkrumony/view/detail.dart';
import 'package:finalprojectkrumony/view/displayuser.dart';
import 'package:finalprojectkrumony/authentication/loginpage.dart';
import 'package:finalprojectkrumony/view/firstpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
