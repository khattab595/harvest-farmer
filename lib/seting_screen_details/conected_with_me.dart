import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class Conected_me extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Conected_me> {
  @override
  var facebook = "https://www.facebook.com/ ";

  var mail = "https://mail.google.com/mail/u/0/?tab=rm#inbox";
  var whatsapp = "https://web.whatsapp.com/";
  void openurl() async {
    await launch(facebook);
  }



  void openmail() async {
    await launch(mail);
  }

  void openwhatsapp() async {
    await launch(whatsapp);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Harvest Farmer"),
          backgroundColor: Colors.green,
        ),
        body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.lightGreen),
          clipper: getClipper(),
        ),
        Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://k.top4top.io/p_1528uy8no1.jpg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.green)
                        ])),
                SizedBox(height: 30.0),
                Text(
                  'Harvest',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontFamily: 'Pacifico'),
                ),
                SizedBox(height: 5.0),
                Text(
                  ' لتسويق الخضراوات والفواكه',
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.green,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 15.0),
                Container(
                    height: 30.0,
                    width: 220.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      child: GestureDetector(
                        onTap: openurl,
                        child: Center(
                          child: Text(
                            'facebook',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 15.0),
                Container(
                    height: 30.0,
                    width: 220.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: openwhatsapp,
                        child: Center(
                          child: Text(
                            '055555555',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 15.0),
                Container(
                    height: 30.0,
                    width: 220.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: openmail,
                        child: Center(
                          child: Text(
                            'harvistapp@gmail.com',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 15.0),
//

              ],
            ))
      ],
    ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
