import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class Show extends StatefulWidget {
  const Show({Key? key}) : super(key: key);

  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {

  var locationMessage = '';
  var latitude;
  var longitude;
  var number;

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;
    // passing this to latitude and longitude strings
    latitude = lat;
    longitude = long;
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    number = '+919074668558';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      MapsLauncher.launchCoordinates(latitude, longitude);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text('Current Location'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      MapsLauncher.launchCoordinates(latitude, longitude);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text('Near By Hospitals'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      await canLaunch('tel:108') ? await launch('tel:108') : throw 'Could not launch';
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text('Call Service'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      MapsLauncher.launchCoordinates(latitude, longitude);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text('On Video Recording'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
