import 'package:flutter/material.dart';
import 'package:harvest/Screens/auth_screen.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/page_model.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<PageModel> pages;

  ValueNotifier<int> pageIndexNotifier = ValueNotifier(0);

  void showPage() {
    pages = List<PageModel>();
    pages.add(
      PageModel(
        'يا مراحب ',
        'اهلا بالمزارعين ',
        "assets/images/1.jpg",
      
      ),
    );
    pages.add(
      PageModel(
        'يا مراحب',
        'اعرض جميع منتجاتك للبيع',
        "assets/images/2.jpg",
        
      ),
    );
    pages.add(
      PageModel(
        'يا مراحب',
        'نسهل عليك العرض والتعديل علي المنتج',
        "assets/images/3.jpg",
        
      ),
    );
     pages.add(
      PageModel(
        'يا مراحب ',
        'سنسهل عليك عملية البيع والعرض والشراء للمنتجات لما تتوقف هيا اذهب للعرض الان',
        "assets/images/4.jpg",
        
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    showPage();
    return Stack(
      children: <Widget>[
        Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Colors.green[400],
                  Colors.green[600],
                  Colors.green[700],
                  Colors.green[900],
                  
                  // Color(0xFF3594DD),
                  // Color(0xFF4563DB),
                  // Color(0xFF5036D5),
                  // Color(0xFF5B16D0),
                ],
              ),
            ),
            child: PageView.builder(
              itemBuilder: (context, index) => Column(
                children: <Widget>[
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        image: DecorationImage(
                            image: ExactAssetImage(pages[index].image),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Text(
                            pages[index].title.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            right: 60.0,
                            left: 60.0,
                          ),
                          child: Text(
                            pages[index].description,
                            style: TextStyle(
                                color: Colors.white, fontSize: 16, height: 1.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              itemCount: pages.length,
              onPageChanged: (index) {
                pageIndexNotifier.value = index;
              },
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -90),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: showPageIndicator(pages.length)),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 19.0,
            right: 30,
            left: 30,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 42,
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.blue.shade700,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        _updateScreen();
                        return AuthScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  "GET STARTED",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    letterSpacing: 1.3,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget showPageIndicator(int length) {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) =>
          Circle(size: 8.0, color: Colors.white70),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOutSine,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.blue.shade300,
        ),
      ),
    );
  }

  _updateScreen()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('seen', true);
  }
}
