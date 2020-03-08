import 'package:flutter/material.dart';
import 'package:harvest/Screens/products_overview_screen.dart';
import '../Screens/auth_screen.dart';

import 'package:url_launcher/url_launcher.dart';

class Conected_me extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Conected_me> {
  @override
  var facebook = "https://www.facebook.com/akhattab595";
  var linkedin = "https://www.linkedin.com/in/ahmed-khattab-a421b118b/";
  var mail = "https://mail.google.com/mail/u/0/?tab=rm#inbox";
  var whatsapp = "https://web.whatsapp.com/";
  void openurl() async {
    await launch(facebook);
  }

  void openurllinkedin() async {
    await launch(linkedin);
  }

  void openmail() async {
    await launch(mail);
  }

  void openwhatsapp() async {
    await launch(whatsapp);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.green),
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
                                "https://scontent-hbe1-1.xx.fbcdn.net/v/t1.15752-9/70048258_952941325045661_4803736103838285824_n.png?_nc_cat=103&_nc_oc=AQkQ7Gj-fCCo2ZK1R00lQEP1fxbNzaHTPKYBz_jv7rt2fknq2O8Ejz6ChgJwl6PR4uQ&_nc_ht=scontent-hbe1-1.xx&oh=427702e99e7399c12be8c46318430b9c&oe=5E0F6CCD"),
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
                            '01279658745',
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
                            ' akhattab595@gmail.com',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 15.0),
//                Container(
//                    height: 30.0,
//                    width: 220.0,
//                    child: Material(
//                      borderRadius: BorderRadius.circular(20.0),
//                      shadowColor: Colors.greenAccent,
//                      color: Colors.green,
//                      elevation: 7.0,
//                      child: GestureDetector(
//                        onTap: openurllinkedin,
//                        child: Center(
//                          child: Text(
//                            'linkedin',
//                            style: TextStyle(
//                                color: Colors.white, fontFamily: 'Montserrat'),
//                          ),
//                        ),
//                      ),
//                    )),
//                SizedBox(height: 15.0),
                Container(
                    height: 30.0,
                    width: 220.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
//                        onTap: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => new ProdactsOverViewScreen()));
//                        },
                        onTap: (){
                          Navigator.of(context).pushReplacementNamed("/");

                        },
                        child: Center(
                          child: Text(
                            'خروج',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ))
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
