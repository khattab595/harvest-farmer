import 'package:flutter/material.dart';

class ask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Harvest Farmer"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only( bottom: 20.0),
              child: Text(
                "أسئله متكرره",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
            ),

          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only( bottom: 7.0),
              child: Text(
                "كيفية اضافة منتج؟",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ),

          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "كل ما عليك هو الذهاب الي ادارة المنتجات  وفي اعلي اليمين هناك ايكون اضافه  يمكنك الضغط عليه وادخال بيانات المنتج ",
                  style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only( bottom: 7.0),
              child: Text(
                "كيفية الشراء من التطبيق؟",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ),

          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "كل ما عليك هو تنزيل التطبيق الاخر الخاص بالشراء  وشراء المنتج والتواصل مع صاحب المنتج ومعرفة التفاصيل عن المنتج   ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),


        ],
      ),
    );
  }
}
