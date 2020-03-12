import 'package:flutter/material.dart';
import 'package:harvest/Screens/settings_account_screen.dart';

class payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ادفع'),),
      body: Material(
        color: Colors.white,
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30.0),
              ),
              Image.asset(
                "assets/images/photobaye.png",
                width: 200.0,
                height: 200.0,
              ),
              new ListTile(
                title: TextFormField(

                  decoration: new InputDecoration(
                      labelText: "رقم الفيزا ",
                      hintText: "من فضلك ادخل الرقم",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              new ListTile(
                title: new Material(
                  color: Colors.lightBlue,
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(25.0),
                  child: new MaterialButton(
                    height: 47.0,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new SettingsAccountScreen()));
                    },
                    child: Text(
                      "ادفع",
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }}