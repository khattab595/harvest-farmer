import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  static const routeName = '/about';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Harvest Farmer"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50, right: 50, left: 50),
            child: Center(
              child: Text('عن التطبيق', style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green
              ),),
            ),
          ),
          Divider(
            color: Colors.green,
            indent: 60,
            endIndent: 60,

          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              right: 18,
              top: 50,
            ),
            child: Text(
              'هذا التطبيق خاص بالمزارعين حيث يسمح للمزارع باضافة منتجاته وعرض تفاصيل عنها ويمكنه التعديل علي المنتج وحذفه اذا اراد ذلك كما يمكنه بيع منتجاته من خلال تطبيق اخر خاص بالمشروع',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
