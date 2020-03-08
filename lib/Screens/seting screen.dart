import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share/share.dart';
import '../seting_screen_details/about_app.dart';
import '../seting_screen_details/conected_with_me.dart';
import '../seting_screen_details/ask%20_replaye.dart';
import '../seting_screen_details/seyasa.dart';
import '../seting_screen_details/terms.dart';

class seteing_screen extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<seteing_screen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Harvest Farmer"),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: new Center(
              child: Column(
            children: <Widget>[
              SizedBox(height: 15.0),
              Container(
                  height: 50.0,
                  width: 280.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new Tearms()));
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.forward,
                            color: Colors.white,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 90.0),
                              child: Text(
                                ' الشروط والأحكام',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Montserrat'),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 15.0),
              Container(
                  height: 50.0,
                  width: 280.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new Conected_me()));
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.forward,
                            color: Colors.white,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 90.0),
                              child: Text(
                                ' اتصل بنا',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Montserrat'),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 15.0),
              Container(
                  height: 50.0,
                  width: 280.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => new ask()));
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.forward,
                            color: Colors.white,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 90.0),
                              child: Text(
                                'الأسئله المتكرره',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Montserrat'),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 15.0),
              Container(
                  height: 50.0,
                  width: 280.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new seyasa()));
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.forward,
                            color: Colors.white,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 90.0),
                              child: Text(
                                ' سياسة الخصوصيه',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Montserrat'),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 15.0),
              Container(
                  height: 50.0,
                  width: 280.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: (){
                        Share.share('text');
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.forward,
                            color: Colors.white,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 90.0),
                              child: Text(
                                'شارك التطبيق',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Montserrat'),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 15.0),
              Container(
                  height: 50.0,
                  width: 280.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new   AboutApp()));
                      },

                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.forward,
                            color: Colors.white,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 90.0),
                              child: Text(
                                ' عن التطبيق',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Montserrat'),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),

//
            ],
          )),
        ));
  }
}
