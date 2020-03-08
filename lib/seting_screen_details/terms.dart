import 'package:flutter/material.dart';

class Tearms extends StatelessWidget {
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
                "الشروط والاحكام",
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
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "تتجدد شروط الاستخدام من حين لآخر، وفي حالة إجراء مثل هذه التحديثات سيعرض تطبيق وثاق تنبيهات لكي يكون       (العميل / المُستخدِم) على علم بها. استمرار المُستخدِم في استعمال تطبيق وثاق قائم على قبول شروط وأحكام الاستخدام الآتية، حسب ما يجري تعديلها من وقت لآخر من أجل خدمة أفضل وجودة أعلى. علماً بأن أي مخالفة لهذه الاتفاقية من قبل (العميل / المُستخدِم) قد تعرض حسابه للإيقاف دون إشعار مسبق وبلا أي مبالغ مسترجعة في بعض الحالات ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
