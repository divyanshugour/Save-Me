import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_me/connect.dart';
import 'package:save_me/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";

  static Future<bool> saveUserLoggedInSharedPreference(bool isUserLoggedIn) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/login.gif',height: 400,),
              TextField(
                controller: name,
                decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: GoogleFonts.dancingScript(fontWeight: FontWeight.bold,fontSize: 20),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo),
                    )
                ),
              ),
              const SizedBox(height: 20.0,),
              TextField(
                controller: password,
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: GoogleFonts.dancingScript(fontWeight: FontWeight.bold,fontSize: 20),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo),
                    )
                ),
                obscureText: true,
              ),
              const SizedBox(height: 40.0,),
              ElevatedButton(
                onPressed: (){

                  FirebaseFirestore.instance
                      .collection('user_info').where("password", isEqualTo: password.text).get().then((snapshot){
                        if (snapshot.docs.isEmpty){
                          Fluttertoast.showToast(
                              msg: "Credentials are not correct !",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.indigo,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }else{
                          saveUserLoggedInSharedPreference(true);
                          Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const Connect()),
                              );
                        }
                  });

                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text('Login'),
                ),
              ),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.dancingScript(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Register()),
                      );
                    },
                    child: const Text("Register",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),),

                  )
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}


