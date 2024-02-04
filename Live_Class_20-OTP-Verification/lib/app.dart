import 'package:flutter/material.dart';
import 'package:my_first_app/homepage.dart';
import 'package:my_first_app/splash_screen.dart';

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreenPage()
        //home: const MyHomePage(title: 'My First Mobile Application')
        );
  }
}
