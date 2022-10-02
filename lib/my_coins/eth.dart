import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spider_wallet/bitcoin_buy.dart';
import 'package:spider_wallet/ethereum_buy.dart';
import 'package:spider_wallet/token_sends/btc_send.dart';
import 'package:spider_wallet/token_sends/eth_send.dart';

class Eth extends StatefulWidget {
  Eth({Key? key}) : super(key: key);

  @override
  State<Eth> createState() => _EthState();
}

class _EthState extends State<Eth> {
  final Stream<QuerySnapshot> user = FirebaseFirestore.instance
      .collection('${FirebaseAuth.instance.currentUser!.email}')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 3, 3, 1),
      body: StreamBuilder<QuerySnapshot>(
        stream: user,
        builder: (context, snapshots) {
          return (snapshots.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator(color: Colors.white))
              : ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshots.data!.docs[index].data()
                        as Map<String, dynamic>;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                          borderRadius:
                                              BorderRadius.circular(150)),
                                    ),
                                    alignment: Alignment.center,
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(3, 3, 3, 0.65),
                                        borderRadius:
                                            BorderRadius.circular(150),
                                        border: Border.all(
                                            color:
                                                Color.fromRGBO(30, 30, 30, 1))),
                                  )),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: 'Ethereum',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500),
                                  children: [
                                    TextSpan(
                                        text: ' ETH',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.30),
                                            fontSize: 21,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500))
                                  ]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: Container(
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(150),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(2, -3),
                                          blurRadius: 15,
                                          color: Color.fromRGBO(
                                              98, 126, 234, 0.85))
                                    ]),
                                child:
                                    Image.asset('assets/eth.png', height: 107)),
                            width: 125,
                            height: 125,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                    color: Color.fromRGBO(35, 35, 35, 1)),
                                borderRadius: BorderRadius.circular(150)),
                          ),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Center(
                          child: Text('${data['eth'].toString()} ETH',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(150),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EthSend()));
                                },
                                child: Container(
                                  child: Icon(
                                      CupertinoIcons.arrow_up_circle_fill,
                                      color: Colors.white,
                                      size: 30),
                                  width: 65,
                                  height: 65,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(3, 3, 3, 0.75),
                                      border: Border.all(
                                          color: Color.fromRGBO(25, 25, 25, 1)),
                                      borderRadius: BorderRadius.circular(150)),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(150),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Ethereum()));
                                },
                                child: Container(
                                  child: Icon(CupertinoIcons.cart_badge_plus,
                                      color: Colors.white, size: 30),
                                  width: 65,
                                  height: 65,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(3, 3, 3, 0.75),
                                      border: Border.all(
                                          color: Color.fromRGBO(25, 25, 25, 1)),
                                      borderRadius: BorderRadius.circular(150)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  });
        },
      ),
    );
  }
}
