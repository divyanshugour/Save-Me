import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_me/login.dart';
import 'package:save_me/register.dart';
import 'package:save_me/show.dart';
import 'package:shake/shake.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Connect extends StatefulWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {

  bool isConnected = false;
  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";

  void shakeOn(){
    ShakeDetector.autoStart(onPhoneShake: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Show()),
      );
    });
  }

  static Future<bool> saveUserLoggedInSharedPreference(bool isUserLoggedIn) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder:(BuildContext context) => Scaffold(
          appBar: AppBar(
            title: Text('Save Me',
              style: GoogleFonts.dancingScript(fontWeight: FontWeight.bold,fontSize: 25),
            ),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              saveUserLoggedInSharedPreference(false);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            child: const Icon(Icons.logout),
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: isConnected ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/connected.gif',height: 200,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Connected with car',
                    style: GoogleFonts.dancingScript(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
              ],
            ):
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/notconnected.gif'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Please connect with your car bluetooth.',
                  style: GoogleFonts.dancingScript(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        shakeOn();
                        isConnected = true;
                      });
                    },
                    child: const Text('CONNECT'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
