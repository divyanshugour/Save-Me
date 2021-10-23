import 'package:flutter/material.dart';
import 'package:save_me/connect.dart';
import 'package:save_me/spalash_screen.dart';

void main() {
  runApp(const MyApp());
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
