import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spider_wallet/firebase_services.dart';
import 'package:spider_wallet/home_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(3, 3, 3, 1),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/back.png'), fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 65),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('SPIDER WALLET',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.58),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 8.7)),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 65),
                  child: RichText(
                    text: TextSpan(
                        text: 'Sign in\n',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'SPIDER WALLET.',
                              style: TextStyle(
                                  height: 1.58,
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700))
                        ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () async {
                      await FirebaseServices().signInWithGoogle();
                      var db = FirebaseFirestore.instance.collection(
                          '${FirebaseAuth.instance.currentUser!.email}');
                      db.doc('user').set({
                        'btc': FieldValue.increment(0),
                        'eth': FieldValue.increment(0),
                        'usdt': FieldValue.increment(0),
                        'xrp': FieldValue.increment(0),
                        'ada': FieldValue.increment(0),
                        'dot': FieldValue.increment(0),
                        'spd': FieldValue.increment(0),
                        'algo': FieldValue.increment(0),
                        'cred': FieldValue.increment(0),
                        'matic': FieldValue.increment(0),
                        'xtz': FieldValue.increment(0),
                        'usd': FieldValue.increment(0),
                      }, SetOptions(merge: true));
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(21),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/google.png', height: 25),
                          SizedBox(width: 12),
                          Text('Sign in with Google',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(color: Color.fromRGBO(25, 25, 25, 1))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
