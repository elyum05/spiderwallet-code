import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spider_wallet/bitcoin_buy.dart';
import 'package:spider_wallet/capitalize.dart';
import 'package:spider_wallet/cardano_buy.dart';
import 'package:spider_wallet/dollar_buy.dart';
import 'package:spider_wallet/ethereum_buy.dart';
import 'package:spider_wallet/polkadot_buy.dart';
import 'package:spider_wallet/polygon_buy.dart';
import 'package:spider_wallet/ripple_buy.dart';
import 'package:spider_wallet/soon.dart';
import 'package:spider_wallet/spider_buy.dart';
import 'package:spider_wallet/tether_buy.dart';
import 'package:spider_wallet/tezos_buy.dart';
import 'package:spider_wallet/token_sends/ada_send.dart';
import 'package:spider_wallet/token_sends/algo_send.dart';
import 'package:spider_wallet/token_sends/btc_send.dart';
import 'package:spider_wallet/token_sends/cred_send.dart';
import 'package:spider_wallet/token_sends/dot_send.dart';
import 'package:spider_wallet/token_sends/eth_send.dart';
import 'package:spider_wallet/token_sends/polygon_send.dart';
import 'package:spider_wallet/token_sends/spd_send.dart';
import 'package:spider_wallet/token_sends/usd_send.dart';
import 'package:spider_wallet/token_sends/usdt_send.dart';
import 'package:spider_wallet/token_sends/xrp_send.dart';
import 'package:spider_wallet/token_sends/xtz_send.dart';
import 'package:spider_wallet/verify_buy.dart';

import 'algorand_buy.dart';

class Send extends StatefulWidget {
  Send({Key? key}) : super(key: key);

  @override
  State<Send> createState() => _SendState();
}

class _SendState extends State<Send> {
  final Stream<QuerySnapshot> user = FirebaseFirestore.instance
      .collection('${FirebaseAuth.instance.currentUser!.email}')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 3, 3, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 45,
          ),
          Padding(
            padding: EdgeInsets.all(18),
            child: InkWell(
                borderRadius: BorderRadius.circular(150),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Container(
                    child: Icon(CupertinoIcons.arrow_left, color: Colors.black),
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
                      border: Border.all(color: Color.fromRGBO(30, 30, 30, 1))),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text('Choose the coin for send.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w500)),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: user,
            builder: (context, snapshots) {
              return (snapshots.connectionState == ConnectionState.waiting)
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.white))
                  : Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshots.data!.docs.length,
                          itemBuilder: (context, index) {
                            var data = snapshots.data!.docs[index].data()
                                as Map<String, dynamic>;
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BtcSend()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(21),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          150),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(2, -3),
                                                        blurRadius: 15,
                                                        color: Color.fromRGBO(
                                                            248, 159, 52, 0.85))
                                                  ]),
                                              child: Image.asset(
                                                  'assets/btc.png',
                                                  height: 45)),
                                          width: 58,
                                          height: 58,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      35, 35, 35, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(150)),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Bitcoin',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text('BTC',
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.65),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400))
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
                                                        fontWeight:
                                                            FontWeight.w500))
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
                                            builder: (context) => EthSend()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(21),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          150),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(2, -3),
                                                        blurRadius: 15,
                                                        color: Color.fromRGBO(
                                                            98, 126, 234, 0.85))
                                                  ]),
                                              child: Image.asset(
                                                  'assets/eth.png',
                                                  height: 45)),
                                          width: 58,
                                          height: 58,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      35, 35, 35, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(150)),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Ethereum',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text('ETH',
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.65),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400))
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
                                                        fontWeight:
                                                            FontWeight.w500))
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
                                            builder: (context) => UsdtSend()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(21),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          150),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(2, -3),
                                                        blurRadius: 15,
                                                        color: Color.fromRGBO(
                                                            38, 161, 123, 0.85))
                                                  ]),
                                              child: Image.asset(
                                                  'assets/usdt.png',
                                                  height: 45)),
                                          width: 58,
                                          height: 58,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      35, 35, 35, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(150)),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Tether',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text('USDT',
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.65),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400))
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
                                                        fontWeight:
                                                            FontWeight.w500))
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
                                            builder: (context) => XrpSend()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(21),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          150),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(2, -3),
                                                        blurRadius: 15,
                                                        color: Color.fromRGBO(
                                                            35, 41, 47, 0.85))
                                                  ]),
                                              child: Image.asset(
                                                  'assets/xrp.png',
                                                  height: 45)),
                                          width: 58,
                                          height: 58,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      35, 35, 35, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(150)),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Ripple',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text('XRP',
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.65),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400))
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
                                                        fontWeight:
                                                            FontWeight.w500))
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
                                            builder: (context) => AdaSend()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(21),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          150),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(2, -3),
                                                        blurRadius: 15,
                                                        color: Color.fromRGBO(
                                                            13, 30, 48, 0.85))
                                                  ]),
                                              child: Image.asset(
                                                  'assets/ada.png',
                                                  height: 45)),
                                          width: 58,
                                          height: 58,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      35, 35, 35, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(150)),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Cardano',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text('ADA',
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.65),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400))
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
                                                        fontWeight:
                                                            FontWeight.w500))
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
                                            builder: (context) => DotSend()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(21),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          150),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(2, -3),
                                                        blurRadius: 15,
                                                        color: Color.fromRGBO(
                                                            230, 0, 122, 0.85))
                                                  ]),
                                              child: Image.asset(
                                                  'assets/dot.png',
                                                  height: 45)),
                                          width: 58,
                                          height: 58,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      35, 35, 35, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(150)),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Polkadot',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text('DOT',
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.65),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400))
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
                                                        fontWeight:
                                                            FontWeight.w500))
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
                                            builder: (context) => MaticSend()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(21),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          150),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(2, -3),
                                                        blurRadius: 15,
                                                        color: Color.fromRGBO(
                                                            111, 65, 216, 0.85))
                                                  ]),
                                              child: Image.asset(
                                                  'assets/matic.png',
                                                  height: 45)),
                                          width: 58,
                                          height: 58,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      35, 35, 35, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(150)),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Polygon',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text('MATIC',
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.65),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400))
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
                                                        fontWeight:
                                                            FontWeight.w500))
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
                                            builder: (context) => CredSend()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(21),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          150),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(2, -3),
                                                        blurRadius: 15,
                                                        color: Color.fromRGBO(
                                                            55, 232, 163, 0.85))
                                                  ]),
                                              child: Image.asset(
                                                  'assets/cred.png',
                                                  height: 45)),
                                          width: 58,
                                          height: 58,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      35, 35, 35, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(150)),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Verify',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text('CRED',
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.65),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400))
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
                                                        fontWeight:
                                                            FontWeight.w500))
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
                                            builder: (context) => XtzSend()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(21),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          150),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(2, -3),
                                                        blurRadius: 15,
                                                        color: Color.fromRGBO(
                                                            166, 224, 0, 0.85))
                                                  ]),
                                              child: Image.asset(
                                                  'assets/xtz.png',
                                                  height: 45)),
                                          width: 58,
                                          height: 58,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      35, 35, 35, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(150)),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Tezos',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text('XTZ',
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.65),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400))
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
                                                        fontWeight:
                                                            FontWeight.w500))
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
                                            builder: (context) => AlgoSend()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(21),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          150),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(2, -3),
                                                        blurRadius: 15,
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                30,
                                                                44)
                                                            .withOpacity(0.85))
                                                  ]),
                                              child: Image.asset(
                                                  'assets/algo.png',
                                                  height: 45)),
                                          width: 58,
                                          height: 58,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      35, 35, 35, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(150)),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Algorand',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text('ALGO',
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.65),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400))
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
                                                        fontWeight:
                                                            FontWeight.w500))
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
                                            builder: (context) => SpdSend()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(21),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          150),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(2, -3),
                                                        blurRadius: 15,
                                                        color: Color.fromARGB(
                                                                255, 4, 8, 255)
                                                            .withOpacity(0.85))
                                                  ]),
                                              child: Image.asset(
                                                  'assets/spider.png',
                                                  height: 45)),
                                          width: 58,
                                          height: 58,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      35, 35, 35, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(150)),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Spider',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text('SPD',
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.65),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400))
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
                                                        fontWeight:
                                                            FontWeight.w500))
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
                                            builder: (context) => UsdSend()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(21),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          150),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(2, -3),
                                                        blurRadius: 15,
                                                        color: Color.fromRGBO(
                                                            46, 242, 49, 0.85))
                                                  ]),
                                              child: Image.asset(
                                                  'assets/usd.png',
                                                  height: 45)),
                                          width: 58,
                                          height: 58,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      35, 35, 35, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(150)),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Dollar',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text('USD',
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.65),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400))
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
                                                        fontWeight:
                                                            FontWeight.w500))
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    );
            },
          ),
        ],
      ),
    );
  }
}
