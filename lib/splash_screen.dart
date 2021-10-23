import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_me/login.dart';
import 'package:splash_screen_view/SplashScreenView.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    initialise();
  }

  Future<void> initialise() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const Login(),
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
