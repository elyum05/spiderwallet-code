import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Soon extends StatefulWidget {
  Soon({Key? key}) : super(key: key);

  @override
  State<Soon> createState() => _SoonState();
}

class _SoonState extends State<Soon> {
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
                          border:
                              Border.all(color: Color.fromRGBO(30, 30, 30, 1))),
                    )),
              ),
              SizedBox(
                height: 215,
              ),
              Center(
                child: Text('Coming soon...',
                    style: TextStyle(
                        letterSpacing: 7.5,
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Diploma')),
              )
            ],
          )),
    );
  }
}
