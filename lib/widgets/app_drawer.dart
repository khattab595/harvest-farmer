import 'package:flutter/material.dart';
import 'package:harvest/Screens/mazad.dart';
import 'package:harvest/Screens/user_mazad.dart';
import '../Screens/seting%20screen.dart';
import '../Screens/settings_account_screen.dart';


import '../providers/auth.dart';
import '../Screens/user_products_screen.dart';
import 'package:provider/provider.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(title: Text('مرحبا بالمزارعين '),
          centerTitle: true,
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,),
          Divider(),
          ListTile(leading: Icon(Icons.shop),
          title: Text('Harvest'),
          onTap: (){
            Navigator.of(context).pushReplacementNamed("/");

          },),

          Divider(),
          ListTile(leading: Icon(Icons.edit),
            title: Text('ادارة المنتجات'),
            onTap: (){
             Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);

            },),
          Divider(),
          ListTile(leading: Icon(Icons.add_circle),
            title: Text('اضافة منتج للمزاد'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(UserProductsScreenmazad.routeName);

            },),
          Divider(),
          ListTile(leading: Icon(Icons.person),
            title: Text('  الملف الشخصي'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new  SettingsAccountScreen()));
            },),
          Divider(),
          ListTile(leading: Icon(Icons.settings),
            title: Text('الاعدادات'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new  seteing_screen()));
            },),

          Divider(),
          ListTile(leading: Icon(Icons.exit_to_app),
            title: Text('تسجيل الخروج'),
            onTap: (){
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/');
           //   Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
              Provider.of<Auth>(context,listen: false).logout();

            },)
        ],
      ),
    );
  }
}
