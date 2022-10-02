import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:spider_wallet/success.dart';

class XrpSend extends StatefulWidget {
  XrpSend({Key? key}) : super(key: key);

  @override
  State<XrpSend> createState() => _XrpSendState();
}

class _XrpSendState extends State<XrpSend> {
  final Stream<QuerySnapshot> user = FirebaseFirestore.instance
      .collection('${FirebaseAuth.instance.currentUser!.email}')
      .snapshots();

  final recipient = TextEditingController();

  final amount = TextEditingController();

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
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18, vertical: 12),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(3, 3, 3, 1),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Color.fromRGBO(25, 25, 25, 1))),
                            child: TextField(
                              controller: recipient,
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Poppins'),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                      CupertinoIcons.profile_circled,
                                      color: Colors.white.withOpacity(0.58)),
                                  hintText: 'Recipient ID',
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.58),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins'),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18, vertical: 12),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(3, 3, 3, 1),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Color.fromRGBO(25, 25, 25, 1))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: amount,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins'),
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                            CupertinoIcons.profile_circled,
                                            color:
                                                Colors.white.withOpacity(0.58)),
                                        hintText: 'Amount XRP',
                                        hintStyle: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.58),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Poppins'),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: data['xrp'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: ' XRP',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.30),
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500))
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(30),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(15),
                              onTap: () {
                                if (amount.text.isNotEmpty &&
                                    recipient.text.isNotEmpty) {
                                  double amountSend = double.parse(amount.text);
                                  showAnimatedDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          alignment: Alignment.bottomCenter,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          titleTextStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 21,
                                              fontWeight: FontWeight.w700),
                                          backgroundColor:
                                              Color.fromRGBO(12, 12, 12, 0.75),
                                          contentTextStyle: TextStyle(
                                              color: Color.fromRGBO(
                                                  181, 181, 181, 1),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                          title: Center(
                                              child: Text("Confirm you order")),
                                          content: Container(
                                            height: 145,
                                            child: Column(
                                              children: [
                                                Text(
                                                    'Do you want to send ${amount.text} UXR to ${recipient.text}?',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5,
                                                              vertical: 15),
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
                                                            child: Icon(
                                                              CupertinoIcons
                                                                  .xmark,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            width: 62,
                                                            height: 62,
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5,
                                                              vertical: 15),
                                                      child: InkWell(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(150),
                                                        onTap: () {
                                                          if (data['xrp'] <
                                                              amountSend) {
                                                            showAnimatedDialog(
                                                              context: context,
                                                              barrierDismissible:
                                                                  true,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25),
                                                                    ),
                                                                    titleTextStyle: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            21,
                                                                        fontWeight: FontWeight
                                                                            .w700),
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            12,
                                                                            12,
                                                                            12,
                                                                            0.75),
                                                                    contentTextStyle: TextStyle(
                                                                        color: Color.fromRGBO(
                                                                            181,
                                                                            181,
                                                                            181,
                                                                            1),
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight: FontWeight
                                                                            .w400),
                                                                    title: Center(
                                                                        child: Text(
                                                                            "Oops!")),
                                                                    content:
                                                                        Container(
                                                                      height:
                                                                          275,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Container(
                                                                            child:
                                                                                Container(
                                                                              child: Icon(CupertinoIcons.xmark, color: Colors.white, size: 45),
                                                                              width: 71,
                                                                              height: 71,
                                                                              alignment: Alignment.center,
                                                                              decoration: BoxDecoration(color: Color.fromARGB(255, 243, 39, 39), borderRadius: BorderRadius.circular(150)),
                                                                            ),
                                                                            alignment:
                                                                                Alignment.center,
                                                                            width:
                                                                                85,
                                                                            height:
                                                                                85,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(150),
                                                                                border: Border.all(
                                                                                  color: Color.fromRGBO(25, 25, 25, 1),
                                                                                )),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                25,
                                                                          ),
                                                                          Text(
                                                                              'Your balance is insufficient XRP.',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(21),
                                                                            child:
                                                                                InkWell(
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
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          1),
                                                            );
                                                          } else {
                                                            var db =
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        '${FirebaseAuth.instance.currentUser!.email}');
                                                            db.doc('user').set(
                                                                {
                                                                  'xrp': FieldValue
                                                                      .increment(
                                                                          -amountSend)
                                                                },
                                                                SetOptions(
                                                                    merge:
                                                                        true));
                                                            var recdoc =
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        '${recipient.text}');
                                                            recdoc.doc('user').set(
                                                                {
                                                                  'xrp': FieldValue
                                                                      .increment(
                                                                          amountSend)
                                                                },
                                                                SetOptions(
                                                                    merge:
                                                                        true));
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            Success()));
                                                          }
                                                        },
                                                        child: Container(
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Icon(
                                                              CupertinoIcons
                                                                  .checkmark_alt,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            width: 62,
                                                            height: 62,
                                                            decoration: BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        26,
                                                                        19,
                                                                        245),
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
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ));
                                    },
                                    animationType: DialogTransitionType.scale,
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
                                                BorderRadius.circular(25),
                                          ),
                                          titleTextStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 21,
                                              fontWeight: FontWeight.w700),
                                          backgroundColor:
                                              Color.fromRGBO(12, 12, 12, 0.75),
                                          contentTextStyle: TextStyle(
                                              color: Color.fromRGBO(
                                                  181, 181, 181, 1),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                          title: Center(child: Text("Oops!")),
                                          content: Container(
                                            height: 269,
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Container(
                                                    child: Icon(
                                                        CupertinoIcons.xmark,
                                                        color: Colors.white,
                                                        size: 45),
                                                    width: 71,
                                                    height: 71,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 243, 39, 39),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(150)),
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: 85,
                                                  height: 85,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              150),
                                                      border: Border.all(
                                                        color: Color.fromRGBO(
                                                            25, 25, 25, 1),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: 25,
                                                ),
                                                Text(
                                                    'Please, enter amount or recipient id.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Padding(
                                                  padding: EdgeInsets.all(21),
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            150),
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text('OK',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                        width: 62,
                                                        height: 62,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color.fromRGBO(
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
                                                          color: Color.fromRGBO(
                                                              3, 3, 3, 0.45),
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
                                    animationType: DialogTransitionType.scale,
                                    curve: Curves.bounceIn,
                                    duration: Duration(seconds: 1),
                                  );
                                }
                              },
                              child: Container(
                                child: Text('Send',
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
                                    color: Color.fromRGBO(35, 35, 155, 1),
                                  ),
                                ),
                              ),
                            ),
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
