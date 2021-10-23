import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_me/register.dart';
import 'package:shake/shake.dart';

class Connect extends StatefulWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {

  bool isConnected = false;

  // void getCurrentLocation() async {
  //   var position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   var lat = position.latitude;
  //   var long = position.longitude;
  //
  //   // passing this to latitude and longitude strings
  //   latitude = "$lat";
  //   longitude = "$long";
  //
  //   setState(() {
  //     locationMessage = "Latitude: $lat and Longitude: $long";
  //   });
  // }

  // String googleUrl = "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

  void shakeOn(){
    ShakeDetector.autoStart(onPhoneShake: () {
      // getCurrentLocation();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Register()),
      );
    });
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
