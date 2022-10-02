import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:spider_wallet/verify_buy.dart';

import 'algorand_buy.dart';

class BuyCrypto extends StatefulWidget {
  BuyCrypto({Key? key}) : super(key: key);

  @override
  State<BuyCrypto> createState() => _BuyCryptoState();
}

class _BuyCryptoState extends State<BuyCrypto> {
  final Stream<QuerySnapshot> _cryptos =
      FirebaseFirestore.instance.collection('cryptos').snapshots();

  String postSearch = '';

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
            child: Text('Choose the coin for buy.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21, vertical: 15),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    postSearch = val;
                  });
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.search,
                        color: Colors.white.withOpacity(0.58)),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.58),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(16, 16, 16, 1),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: _cryptos,
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
                            if (postSearch.isEmpty) {
                              return InkWell(
                                onTap: () {
                                  if (data['name'] == 'Algorand') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Algorand()));
                                  } else if (data['name'] == 'Bitcoin') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Bitcoin()));
                                  } else if (data['name'] == 'Ethereum') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Ethereum()));
                                  } else if (data['name'] == 'Cardano') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Cardano()));
                                  } else if (data['name'] == 'Spider') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Spider()));
                                  } else if (data['name'] == 'Tezos') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Tezos()));
                                  } else if (data['name'] == 'Polkadot') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Polkadot()));
                                  } else if (data['name'] == 'Tether') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Tether()));
                                  } else if (data['name'] == 'Verify') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Verify()));
                                  } else if (data['name'] == 'Ripple') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Ripple()));
                                  } else if (data['name'] == 'Polygon') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Polygon()));
                                  } else if (data['name'] == 'Dollar') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Dollar()));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Soon()));
                                  }
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
                                                    BorderRadius.circular(150),
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset: Offset(2, -3),
                                                      blurRadius: 15,
                                                      color: Color.fromRGBO(
                                                          data['r'],
                                                          data['g'],
                                                          data['b'],
                                                          data['o']))
                                                ]),
                                            child: Image.network(data['image'],
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
                                          Text(data['name'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                          Text(data['symbol'],
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.65),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400))
                                        ],
                                      ),
                                      Spacer(),
                                      RichText(
                                        text: TextSpan(
                                            text: data['price'].toString(),
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
                              );
                            }
                            if (data['name']
                                .toString()
                                .startsWith(postSearch.capitalize())) {
                              return InkWell(
                                onTap: () {
                                  if (data['name'] == 'Algorand') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Algorand()));
                                  } else if (data['name'] == 'Bitcoin') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Bitcoin()));
                                  } else if (data['name'] == 'Ethereum') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Ethereum()));
                                  } else if (data['name'] == 'Cardano') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Cardano()));
                                  } else if (data['name'] == 'Spider') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Spider()));
                                  } else if (data['name'] == 'Tezos') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Tezos()));
                                  } else if (data['name'] == 'Polkadot') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Polkadot()));
                                  } else if (data['name'] == 'Tether') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Tether()));
                                  } else if (data['name'] == 'Verify') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Verify()));
                                  } else if (data['name'] == 'Ripple') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Ripple()));
                                  } else if (data['name'] == 'Polygon') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Polygon()));
                                  }
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
                                                    BorderRadius.circular(150),
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset: Offset(2, -3),
                                                      blurRadius: 15,
                                                      color: Color.fromRGBO(
                                                          data['r'],
                                                          data['g'],
                                                          data['b'],
                                                          data['o']))
                                                ]),
                                            child: Image.network(data['image'],
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
                                          Text(data['name'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                          Text(data['symbol'],
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.65),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400))
                                        ],
                                      ),
                                      Spacer(),
                                      RichText(
                                        text: TextSpan(
                                            text: data['price'].toString(),
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
                              );
                            }
                            return Container();
                          }),
                    );
            },
          ),
        ],
      ),
    );
  }
}
