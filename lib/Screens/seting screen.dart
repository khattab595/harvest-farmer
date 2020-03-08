import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.only(top:50.0),
          child: new Center(
              child: Column(
            children: <Widget>[
              SizedBox(height: 15.0),
              Container(
                  height: 50.0,
                  width: 220.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    child: GestureDetector(
                      child: Center(
                        child: Text(
                          'الشروط والاحكام',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 15.0),
              Container(
                  height: 50.0,
                  width: 220.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      child: Center(
                        child: Text(
                          'اتصل بنا',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 15.0),
              Container(
                  height: 50.0,
                  width: 220.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      child: Center(
                        child: Text(
                          ' الأسئله المتكرره',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 15.0),
              Container(
                  height: 50.0,
                  width: 220.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      child: Center(
                        child: Text(
                          ' سياسة الخصوصيه',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 15.0),
              Container(
                  height: 50.0,
                  width: 220.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      child: Center(
                        child: Text(
                          ' شارك التطبيق',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 15.0),
              Container(
                  height: 50.0,
                  width: 220.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      child: Center(
                        child: Text(
                          ' عن التطبيق',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  )),

//
            ],
          )),
        ));
  }
}
