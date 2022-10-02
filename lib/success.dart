import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spider_wallet/home_screen.dart';

class Success extends StatefulWidget {
  Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 3, 3, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Success!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: EdgeInsets.all(85),
            child: Container(
              child: Icon(CupertinoIcons.checkmark_alt, size: 58),
              alignment: Alignment.center,
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 43, 235, 145),
                  borderRadius: BorderRadius.circular(150)),
            ),
          ),
          Text('Have a good day!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.75),
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          SizedBox(
            height: 45,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (Route<dynamic> route) => false,
              );
            },
            child: Container(
              child: Text('Good!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.all(21),
              width: 185,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromRGBO(3, 3, 3, 0.75),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color.fromRGBO(30, 30, 30, 1),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
