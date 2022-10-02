import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:spider_wallet/success.dart';

class Tether extends StatefulWidget {
  Tether({Key? key}) : super(key: key);

  @override
  State<Tether> createState() => _TetherState();
}

class _TetherState extends State<Tether> {
  final Stream<QuerySnapshot> user = FirebaseFirestore.instance
      .collection('${FirebaseAuth.instance.currentUser!.email}')
      .snapshots();

  final usdt_sum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(3, 3, 3, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                Text('Buy USDT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w500)),
              ],
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
                              double usdt_price = 1;
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 35),
                                    child: Text('1 USDT = \$${usdt_price}',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.85),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    controller: usdt_sum,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 45,
                                        fontWeight: FontWeight.w500),
                                    decoration: InputDecoration(
                                        hintText: '0 USDT',
                                        hintStyle: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.45),
                                            fontSize: 45,
                                            fontWeight: FontWeight.w500),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none),
                                  ),
                                  SizedBox(height: 45),
                                  InkWell(
                                      borderRadius: BorderRadius.circular(15),
                                      onTap: () {
                                        if (usdt_sum.text.isNotEmpty) {
                                          double amount =
                                              double.parse(usdt_sum.text);
                                          double pay = usdt_price * amount;
                                          showAnimatedDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  titleTextStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          12, 12, 12, 0.75),
                                                  contentTextStyle: TextStyle(
                                                      color: Color.fromRGBO(
                                                          181, 181, 181, 1),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  title: Center(
                                                      child: Text(
                                                          "Confirm you order")),
                                                  content: Container(
                                                    height: 145,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            'Do you confirm to pay ${pay.toString()} USD for ${usdt_sum.text} USDT?',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          5,
                                                                      vertical:
                                                                          15),
                                                              child: InkWell(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            150),
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Icon(
                                                                      CupertinoIcons
                                                                          .xmark,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    width: 62,
                                                                    height: 62,
                                                                    decoration: BoxDecoration(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            243,
                                                                            39,
                                                                            39),
                                                                        borderRadius:
                                                                            BorderRadius.circular(150)),
                                                                  ),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
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
                                                                          color: Color.fromRGBO(
                                                                              25,
                                                                              25,
                                                                              25,
                                                                              1)),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              150)),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          5,
                                                                      vertical:
                                                                          15),
                                                              child: InkWell(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            150),
                                                                onTap: () {
                                                                  if (data[
                                                                          'usd'] <
                                                                      pay) {
                                                                    showAnimatedDialog(
                                                                      context:
                                                                          context,
                                                                      barrierDismissible:
                                                                          true,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                            alignment: Alignment
                                                                                .center,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(25),
                                                                            ),
                                                                            titleTextStyle: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 21,
                                                                                fontWeight: FontWeight.w700),
                                                                            backgroundColor: Color.fromRGBO(12, 12, 12, 0.75),
                                                                            contentTextStyle: TextStyle(color: Color.fromRGBO(181, 181, 181, 1), fontSize: 18, fontWeight: FontWeight.w400),
                                                                            title: Center(child: Text("Oops!")),
                                                                            content: Container(
                                                                              height: 275,
                                                                              child: Column(
                                                                                children: [
                                                                                  Container(
                                                                                    child: Container(
                                                                                      child: Icon(CupertinoIcons.xmark, color: Colors.white, size: 45),
                                                                                      width: 71,
                                                                                      height: 71,
                                                                                      alignment: Alignment.center,
                                                                                      decoration: BoxDecoration(color: Color.fromARGB(255, 243, 39, 39), borderRadius: BorderRadius.circular(150)),
                                                                                    ),
                                                                                    alignment: Alignment.center,
                                                                                    width: 85,
                                                                                    height: 85,
                                                                                    decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(150),
                                                                                        border: Border.all(
                                                                                          color: Color.fromRGBO(25, 25, 25, 1),
                                                                                        )),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 25,
                                                                                  ),
                                                                                  Text('Your balance is insufficient USD.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.all(21),
                                                                                    child: InkWell(
                                                                                      borderRadius: BorderRadius.circular(150),
                                                                                      onTap: () {
                                                                                        Navigator.pop(context);
                                                                                      },
                                                                                      child: Container(
                                                                                        child: Container(
                                                                                          alignment: Alignment.center,
                                                                                          child: Text('OK', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                                                                                          width: 62,
                                                                                          height: 62,
                                                                                          decoration: BoxDecoration(color: Color.fromRGBO(15, 15, 15, 1), borderRadius: BorderRadius.circular(150)),
                                                                                        ),
                                                                                        alignment: Alignment.center,
                                                                                        width: 75,
                                                                                        height: 75,
                                                                                        decoration: BoxDecoration(color: Color.fromRGBO(3, 3, 3, 0.45), border: Border.all(color: Color.fromRGBO(25, 25, 25, 1)), borderRadius: BorderRadius.circular(150)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ));
                                                                      },
                                                                      animationType:
                                                                          DialogTransitionType
                                                                              .scale,
                                                                      curve: Curves
                                                                          .bounceIn,
                                                                      duration: Duration(
                                                                          seconds:
                                                                              1),
                                                                    );
                                                                  } else {
                                                                    var db = FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            '${FirebaseAuth.instance.currentUser!.email}');
                                                                    db.doc('user').set(
                                                                        {
                                                                          'usdt':
                                                                              FieldValue.increment(amount),
                                                                          'usd':
                                                                              FieldValue.increment(-pay)
                                                                        },
                                                                        SetOptions(
                                                                            merge:
                                                                                true));
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                Success()));
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Icon(
                                                                      CupertinoIcons
                                                                          .checkmark_alt,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    width: 62,
                                                                    height: 62,
                                                                    decoration: BoxDecoration(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            26,
                                                                            19,
                                                                            245),
                                                                        borderRadius:
                                                                            BorderRadius.circular(150)),
                                                                  ),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
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
                                                                          color: Color.fromRGBO(
                                                                              25,
                                                                              25,
                                                                              25,
                                                                              1)),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              150)),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ));
                                            },
                                            animationType:
                                                DialogTransitionType.scale,
                                            curve: Curves.fastOutSlowIn,
                                            duration: Duration(seconds: 1),
                                          );
                                        } else {
                                          showAnimatedDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                  alignment: Alignment.center,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  titleTextStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          12, 12, 12, 0.75),
                                                  contentTextStyle: TextStyle(
                                                      color: Color.fromRGBO(
                                                          181, 181, 181, 1),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  title: Center(
                                                      child: Text("Oops!")),
                                                  content: Container(
                                                    height: 248,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          child: Container(
                                                            child: Icon(
                                                                CupertinoIcons
                                                                    .xmark,
                                                                color: Colors
                                                                    .white,
                                                                size: 45),
                                                            width: 71,
                                                            height: 71,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration: BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        243,
                                                                        39,
                                                                        39),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            150)),
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          width: 85,
                                                          height: 85,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              150),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            25,
                                                                            25,
                                                                            25,
                                                                            1),
                                                                  )),
                                                        ),
                                                        SizedBox(
                                                          height: 25,
                                                        ),
                                                        Text(
                                                            'Please, enter amount.',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  21),
                                                          child: InkWell(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        150),
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                    'OK',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w500)),
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
                                                                        BorderRadius.circular(
                                                                            150)),
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
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
                                        }
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 21),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              CupertinoIcons.cart_badge_plus,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Buy',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        width: 185,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(3, 3, 3, 0.75),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color:
                                                Color.fromRGBO(30, 30, 30, 1),
                                          ),
                                        ),
                                      )),
                                ],
                              );
                            }),
                      );
              },
            ),
          ],
        ));
  }
}
