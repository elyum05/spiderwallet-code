import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Receive extends StatefulWidget {
  Receive({Key? key}) : super(key: key);

  @override
  State<Receive> createState() => _ReceiveState();
}

class _ReceiveState extends State<Receive> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/back.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(18),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(150),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Container(
                          child: Icon(CupertinoIcons.arrow_left,
                              color: Colors.black),
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(150)),
                        ),
                        alignment: Alignment.center,
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(3, 3, 3, 0.65),
                            borderRadius: BorderRadius.circular(150),
                            border: Border.all(
                                color: Color.fromRGBO(30, 30, 30, 1))),
                      )),
                ),
                Text('Receive crypto',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500)),
              ],
            ),
            SizedBox(
              height: 87,
            ),
            Center(
                child: Text('Give your ID to the sender.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w500))),
            Padding(
              padding: EdgeInsets.all(28),
              child: Container(
                padding: EdgeInsets.all(18),
                child: Row(
                  children: [
                    Text('ID',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.58),
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    Spacer(),
                    Text('${FirebaseAuth.instance.currentUser!.email}',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.75),
                            fontSize: 16,
                            fontWeight: FontWeight.w500))
                  ],
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(25, 25, 25, 1),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  Clipboard.setData(ClipboardData(
                      text: '${FirebaseAuth.instance.currentUser!.email}'));
                  Navigator.pop(context);
                },
                child: Container(
                  width: 62,
                  height: 62,
                  child: Icon(Icons.copy, color: Colors.black),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(2, -3),
                            blurRadius: 15,
                            color: Colors.white.withOpacity(0.25))
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
