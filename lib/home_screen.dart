import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spider_wallet/buy_crypto.dart';
import 'package:spider_wallet/firebase_services.dart';
import 'package:spider_wallet/my_coins/ada.dart';
import 'package:spider_wallet/my_coins/algo.dart';
import 'package:spider_wallet/my_coins/btc.dart';
import 'package:spider_wallet/my_coins/cred.dart';
import 'package:spider_wallet/my_coins/dot.dart';
import 'package:spider_wallet/my_coins/eth.dart';
import 'package:spider_wallet/my_coins/matic.dart';
import 'package:spider_wallet/my_coins/spd.dart';
import 'package:spider_wallet/my_coins/usd.dart';
import 'package:spider_wallet/my_coins/usdt.dart';
import 'package:spider_wallet/my_coins/xrp.dart';
import 'package:spider_wallet/my_coins/xtz.dart';
import 'package:spider_wallet/receive.dart';
import 'package:spider_wallet/send.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshots.data!.docs[index].data()
                        as Map<String, dynamic>;
                    double sum;
                    double btc_price = 26735;
                    double eth_price = 1690;
                    double ada_price = 0.5;
                    double usdt_price = 1;
                    double xrp_price = 0.36;
                    double dot_price = 8.7;
                    double spd_price = 1.75;
                    double xtz_price = 1.794;
                    double cred_price = 1.5;
                    double algo_price = 0.34;
                    double matic_price = 0.88;
                    sum = (data['btc'] * btc_price) +
                        (data['eth'] * eth_price) +
                        (data['ada'] * ada_price) +
                        (data['usdt'] * usdt_price) +
                        (data['xrp'] * xrp_price) +
                        (data['dot'] * dot_price) +
                        (data['matic'] * matic_price) +
                        (data['cred'] * cred_price) +
                        (data['xtz'] * xtz_price) +
                        (data['algo'] * algo_price) +
                        (data['spd'] * spd_price) +
                        data['usd'];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(150),
                                    onTap: () {
                                      showAnimatedDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              alignment: Alignment.bottomCenter,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  side: BorderSide(
                                                      color: Color.fromRGBO(
                                                          25, 25, 25, 1))),
                                              titleTextStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w700),
                                              backgroundColor:
                                                  Color.fromRGBO(7, 7, 7, 0.95),
                                              contentTextStyle: TextStyle(
                                                  color: Color.fromRGBO(
                                                      181, 181, 181, 1),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                              title: Row(
                                                children: [
                                                  Container(
                                                    width: 52,
                                                    height: 52,
                                                    child: CircleAvatar(
                                                      radius: 21,
                                                      backgroundImage: NetworkImage(
                                                          '${FirebaseAuth.instance.currentUser!.photoURL}'),
                                                    ),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            3, 3, 3, 0.62),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(150),
                                                        border: Border.all(
                                                            color:
                                                                Color.fromRGBO(
                                                                    35,
                                                                    35,
                                                                    35,
                                                                    1))),
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                      '${FirebaseAuth.instance.currentUser!.displayName}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ],
                                              ),
                                              content: Container(
                                                height: 195,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12),
                                                      child: Row(
                                                        children: [
                                                          Text('ID',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.58),
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          Spacer(),
                                                          Text(
                                                              '${FirebaseAuth.instance.currentUser!.email}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.75),
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500))
                                                        ],
                                                      ),
                                                      height: 52,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: Color.fromRGBO(
                                                            25, 25, 25, 1),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      onTap: () {
                                                        Clipboard.setData(
                                                            ClipboardData(
                                                                text:
                                                                    '${FirebaseAuth.instance.currentUser!.email}'));
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(16),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(Icons.copy,
                                                                color: Colors
                                                                    .black),
                                                            SizedBox(width: 10),
                                                            Text('Copy ID',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500))
                                                          ],
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  offset: Offset(
                                                                      2, -3),
                                                                  blurRadius:
                                                                      15,
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.25))
                                                            ]),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    InkWell(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        onTap: () async {
                                                          await FirebaseServices()
                                                              .googleSignOut();
                                                          exit(0);
                                                        },
                                                        child: Container(
                                                            width: 178,
                                                            padding: EdgeInsets
                                                                .all(16),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                    Icons
                                                                        .logout,
                                                                    color: Colors
                                                                        .white),
                                                                SizedBox(
                                                                    width: 10),
                                                                Text('Logout',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontFamily:
                                                                            'Poppins'))
                                                              ],
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            3,
                                                                            3,
                                                                            3,
                                                                            0.75),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              245,
                                                                              65,
                                                                              65,
                                                                              1),
                                                                    )))),
                                                  ],
                                                ),
                                              ));
                                        },
                                        animationType:
                                            DialogTransitionType.scale,
                                        curve: Curves.fastOutSlowIn,
                                        duration: Duration(seconds: 1),
                                      );
                                    },
                                    child: Container(
                                      width: 52,
                                      height: 52,
                                      child: CircleAvatar(
                                        radius: 21,
                                        backgroundImage: NetworkImage(
                                            '${FirebaseAuth.instance.currentUser!.photoURL}'),
                                      ),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(3, 3, 3, 0.62),
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  35, 35, 35, 1))),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                      '${FirebaseAuth.instance.currentUser!.displayName}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  Spacer(),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(150),
                                    onTap: () {
                                      showAnimatedDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              alignment: Alignment.center,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              titleTextStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 21,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w700),
                                              backgroundColor: Color.fromRGBO(
                                                  12, 12, 12, 0.95),
                                              title: Center(
                                                  child: Text("Information")),
                                              content: Container(
                                                height: 258,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Image.asset(
                                                          'assets/spider.png',
                                                          height: 80),
                                                      alignment:
                                                          Alignment.center,
                                                      width: 88,
                                                      height: 88,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      150),
                                                          border: Border.all(
                                                            color:
                                                                Color.fromRGBO(
                                                                    25,
                                                                    25,
                                                                    25,
                                                                    1),
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      height: 25,
                                                    ),
                                                    Text('Spider Wallet',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(21),
                                                      child: InkWell(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(150),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text('OK',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                            width: 62,
                                                            height: 62,
                                                            decoration: BoxDecoration(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        15,
                                                                        15,
                                                                        15,
                                                                        1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            150)),
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          width: 75,
                                                          height: 75,
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      3,
                                                                      3,
                                                                      3,
                                                                      0.45),
                                                              border: Border.all(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          25,
                                                                          25,
                                                                          25,
                                                                          1)),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          150)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ));
                                        },
                                        animationType:
                                            DialogTransitionType.scale,
                                        curve: Curves.bounceIn,
                                        duration: Duration(seconds: 1),
                                      );
                                    },
                                    child: Container(
                                      child: Container(
                                        child: Icon(FontAwesomeIcons.info,
                                            color: Colors.white),
                                        width: 43,
                                        height: 43,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(20, 20, 20, 1),
                                            borderRadius:
                                                BorderRadius.circular(150)),
                                      ),
                                      width: 52,
                                      height: 52,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(3, 3, 3, 0.62),
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  35, 35, 35, 1))),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(30),
                                child: Text('\$${sum.toInt()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(150),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Send()));
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
                                              color: Color.fromRGBO(
                                                  25, 25, 25, 1)),
                                          borderRadius:
                                              BorderRadius.circular(150)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(150),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Receive()));
                                    },
                                    child: Container(
                                      child: Icon(
                                          CupertinoIcons.arrow_down_circle_fill,
                                          color: Colors.white,
                                          size: 30),
                                      width: 65,
                                      height: 65,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(3, 3, 3, 0.75),
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  25, 25, 25, 1)),
                                          borderRadius:
                                              BorderRadius.circular(150)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(150),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BuyCrypto()));
                                    },
                                    child: Container(
                                      child: Icon(
                                          CupertinoIcons.cart_badge_plus,
                                          color: Colors.white,
                                          size: 30),
                                      width: 65,
                                      height: 65,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(3, 3, 3, 0.75),
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  25, 25, 25, 1)),
                                          borderRadius:
                                              BorderRadius.circular(150)),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(25, 25, 25, 1)))),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Btc()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(21),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(2, -3),
                                                blurRadius: 15,
                                                color: Color.fromRGBO(
                                                    248, 159, 52, 0.85))
                                          ]),
                                      child: Image.asset('assets/btc.png',
                                          height: 45)),
                                  width: 58,
                                  height: 58,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Color.fromRGBO(35, 35, 35, 1)),
                                      borderRadius: BorderRadius.circular(150)),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Bitcoin',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text('BTC',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.65),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                                Spacer(),
                                RichText(
                                  text: TextSpan(
                                      text: data['btc'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: ' BTC',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.30),
                                                fontSize: 21,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500))
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Eth()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(21),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(2, -3),
                                                blurRadius: 15,
                                                color: Color.fromRGBO(
                                                    98, 126, 234, 0.85))
                                          ]),
                                      child: Image.asset('assets/eth.png',
                                          height: 45)),
                                  width: 58,
                                  height: 58,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Color.fromRGBO(35, 35, 35, 1)),
                                      borderRadius: BorderRadius.circular(150)),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Ethereum',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text('ETH',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.65),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                                Spacer(),
                                RichText(
                                  text: TextSpan(
                                      text: data['eth'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: ' ETH',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.30),
                                                fontSize: 21,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500))
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Usdt()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(21),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(2, -3),
                                                blurRadius: 15,
                                                color: Color.fromRGBO(
                                                    38, 161, 123, 0.85))
                                          ]),
                                      child: Image.asset('assets/usdt.png',
                                          height: 45)),
                                  width: 58,
                                  height: 58,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Color.fromRGBO(35, 35, 35, 1)),
                                      borderRadius: BorderRadius.circular(150)),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Tether',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text('USDT',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.65),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                                Spacer(),
                                RichText(
                                  text: TextSpan(
                                      text: data['usdt'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: ' USDT',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.30),
                                                fontSize: 21,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500))
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Xrp()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(21),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(2, -3),
                                                blurRadius: 15,
                                                color: Color.fromRGBO(
                                                    35, 41, 47, 0.85))
                                          ]),
                                      child: Image.asset('assets/xrp.png',
                                          height: 45)),
                                  width: 58,
                                  height: 58,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Color.fromRGBO(35, 35, 35, 1)),
                                      borderRadius: BorderRadius.circular(150)),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Ripple',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text('XRP',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.65),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                                Spacer(),
                                RichText(
                                  text: TextSpan(
                                      text: data['xrp'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: ' XRP',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.30),
                                                fontSize: 21,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500))
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Ada()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(21),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(2, -3),
                                                blurRadius: 15,
                                                color: Color.fromRGBO(
                                                    13, 30, 48, 0.85))
                                          ]),
                                      child: Image.asset('assets/ada.png',
                                          height: 45)),
                                  width: 58,
                                  height: 58,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Color.fromRGBO(35, 35, 35, 1)),
                                      borderRadius: BorderRadius.circular(150)),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Cardano',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text('ADA',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.65),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                                Spacer(),
                                RichText(
                                  text: TextSpan(
                                      text: data['ada'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: ' ADA',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.30),
                                                fontSize: 21,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500))
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Dot()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(21),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(2, -3),
                                                blurRadius: 15,
                                                color: Color.fromRGBO(
                                                    230, 0, 122, 0.85))
                                          ]),
                                      child: Image.asset('assets/dot.png',
                                          height: 45)),
                                  width: 58,
                                  height: 58,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Color.fromRGBO(35, 35, 35, 1)),
                                      borderRadius: BorderRadius.circular(150)),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Polkadot',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text('DOT',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.65),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                                Spacer(),
                                RichText(
                                  text: TextSpan(
                                      text: data['dot'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: ' DOT',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.30),
                                                fontSize: 21,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500))
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Matic()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(21),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(2, -3),
                                                blurRadius: 15,
                                                color: Color.fromRGBO(
                                                    111, 65, 216, 0.85))
                                          ]),
                                      child: Image.asset('assets/matic.png',
                                          height: 45)),
                                  width: 58,
                                  height: 58,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Color.fromRGBO(35, 35, 35, 1)),
                                      borderRadius: BorderRadius.circular(150)),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Polygon',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text('MATIC',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.65),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                                Spacer(),
                                RichText(
                                  text: TextSpan(
                                      text: data['matic'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: ' MATIC',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.30),
                                                fontSize: 21,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500))
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cred()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(21),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(2, -3),
                                                blurRadius: 15,
                                                color: Color.fromRGBO(
                                                    55, 232, 163, 0.85))
                                          ]),
                                      child: Image.asset('assets/cred.png',
                                          height: 45)),
                                  width: 58,
                                  height: 58,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Color.fromRGBO(35, 35, 35, 1)),
                                      borderRadius: BorderRadius.circular(150)),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Verify',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text('CRED',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.65),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                                Spacer(),
                                RichText(
                                  text: TextSpan(
                                      text: data['cred'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: ' CRED',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.30),
                                                fontSize: 21,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500))
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Xtz()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(21),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(2, -3),
                                                blurRadius: 15,
                                                color: Color.fromRGBO(
                                                    166, 224, 0, 0.85))
                                          ]),
                                      child: Image.asset('assets/xtz.png',
                                          height: 45)),
                                  width: 58,
                                  height: 58,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Color.fromRGBO(35, 35, 35, 1)),
                                      borderRadius: BorderRadius.circular(150)),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Tezos',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text('XTZ',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.65),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                                Spacer(),
                                RichText(
                                  text: TextSpan(
                                      text: data['xtz'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: ' XTZ',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.30),
                                                fontSize: 21,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500))
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Algo()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(21),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(2, -3),
                                                blurRadius: 15,
                                                color: Color.fromARGB(
                                                        255, 236, 30, 44)
                                                    .withOpacity(0.85))
                                          ]),
                                      child: Image.asset('assets/algo.png',
                                          height: 45)),
                                  width: 58,
                                  height: 58,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Color.fromRGBO(35, 35, 35, 1)),
                                      borderRadius: BorderRadius.circular(150)),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Algorand',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text('ALGO',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.65),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                                Spacer(),
                                RichText(
                                  text: TextSpan(
                                      text: data['algo'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: ' ALGO',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.30),
                                                fontSize: 21,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500))
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Spd()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(21),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(2, -3),
                                                blurRadius: 15,
                                                color: Color.fromARGB(
                                                        255, 4, 8, 255)
                                                    .withOpacity(0.85))
                                          ]),
                                      child: Image.asset('assets/spider.png',
                                          height: 45)),
                                  width: 58,
                                  height: 58,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Color.fromRGBO(35, 35, 35, 1)),
                                      borderRadius: BorderRadius.circular(150)),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Spider',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text('SPD',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.65),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                                Spacer(),
                                RichText(
                                  text: TextSpan(
                                      text: data['spd'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: ' SPD',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.30),
                                                fontSize: 21,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500))
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Usd()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(21),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(2, -3),
                                                blurRadius: 15,
                                                color: Color.fromRGBO(
                                                    46, 242, 49, 0.85))
                                          ]),
                                      child: Image.asset('assets/usd.png',
                                          height: 45)),
                                  width: 58,
                                  height: 58,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Color.fromRGBO(35, 35, 35, 1)),
                                      borderRadius: BorderRadius.circular(150)),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Dollar',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text('USD',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.65),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                                Spacer(),
                                RichText(
                                  text: TextSpan(
                                      text: data['usd'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: ' USD',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.30),
                                                fontSize: 21,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500))
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  });
        },
      ),
    );
  }
}
