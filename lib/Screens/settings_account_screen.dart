import 'package:flutter/material.dart';

import 'package:harvest/Screens/user_products_screen.dart';
import 'package:harvest/seting_screen_details/payment_screen.dart';

import '../widgets/app_drawer.dart';
import 'auth_screen.dart';

enum SingingCharacter { Arabic, English }

class SettingsAccountScreen extends StatefulWidget {
  static const routeName = '/account';

  @override
  _SettingsAccountScreenState createState() => _SettingsAccountScreenState();
}

class _SettingsAccountScreenState extends State<SettingsAccountScreen> {
  SingingCharacter _character = SingingCharacter.Arabic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ادارة الحساب'),
      ),
      drawer: AppDrawer(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20, right: 100, left: 100, bottom: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    'محمد',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                  Text(
                    '0283887327887',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        '0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      Text(
                        'رصيد',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'النقاط \\ 0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      Text(''),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      Text(
                        'عدد الطلبات',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
          Center(
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
                                  builder: (context) => new AuthScreen()));
                        },
                        child: Row(
                          children: <Widget>[

                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 60.0),
                                child: Text(
                                  ' تعديل كلمة المرور',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Montserrat'),
                                
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
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
                                    builder: (context) => new payment()));
                          },
                          child: Row(
                            children: <Widget>[

                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 120.0),
                                  child: Text(
                                    'الدفع',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Montserrat'),
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
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
                                    builder: (context) => new UserProductsScreen()));
                          },
                          child: Row(
                            children: <Widget>[

                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(right:80.0),
                                  child: Text(
                                    'ادارة المنتجات',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Montserrat'),
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),

            Divider(),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'اشحن رصيدك',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    'رصيدك الحالي 00.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Row(
                children: <Widget>[
                  Text(
                    ' تغير اللغة',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      activeColor: Colors.green,
                      title: const Text(
                        ' ع  ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      value: SingingCharacter.Arabic,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text(
                        'E ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      value: SingingCharacter.English,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
