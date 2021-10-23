import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Connect extends StatefulWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
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
                Image.asset('assets/notconnected.gif'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text('Please connect with your vehicle bluetooth.'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Respond to button press
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
