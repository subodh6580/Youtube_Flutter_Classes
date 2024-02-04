import 'package:flutter/material.dart';
//import 'package:my_first_app/homepage.dart';
import 'package:my_first_app/login_screen_page.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        //MaterialPageRoute(builder: (context) => const MyHomePage()
        MaterialPageRoute(builder: (context) => LoginScreenPage()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.blue,
      child: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/logo/saatirmind_logo.png')),
          Text(
            'Learn From Anywhere',
            style: TextStyle(fontSize: 25, color: Colors.white),
          )
        ],
      )),
    ));
  }
}
