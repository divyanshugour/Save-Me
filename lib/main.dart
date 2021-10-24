import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:save_me/show.dart';
import 'package:save_me/splash_screen.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Save Me',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: const SplashScreen(),
    );
  }
}
