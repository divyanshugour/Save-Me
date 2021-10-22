import 'package:flutter/material.dart';

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
            title: const Text('Save Me'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(''),
                OutlineButton(
                  onPressed: (){},
                ),
              ],
            ),
          ),
        ));
  }
}
