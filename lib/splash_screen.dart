import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_me/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'connect.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  bool isLog = false;

  @override
  void initState() {
    initialise();
    getUserLoggedInSharedPreference().then((value) =>
        setState(() {
          isLog = value!;
        }),
    );
  }

  static Future<bool?> getUserLoggedInSharedPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(sharedPreferenceUserLoggedInKey);
  }

  Future<void> initialise() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: isLog ? const Connect() : const Login(),
      duration: 5500,
      imageSize: 250,
      imageSrc: "assets/saveme.gif",
      text: "Save Me",
      textType: TextType.ColorizeAnimationText,
      textStyle: GoogleFonts.dancingScript(fontWeight: FontWeight.bold,fontSize: 40),
      colors: const [
        Colors.indigo,
        Colors.indigo,
        Colors.white,
        Colors.indigo,
      ],
      backgroundColor: Colors.white,
    );
  }
}
