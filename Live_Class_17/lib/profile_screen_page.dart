import 'package:flutter/material.dart';
//import 'package:my_first_app/homepage.dart';
import 'package:my_first_app/login_screen_page.dart';

class ProfileScreenPage extends StatefulWidget {
  @override
  State<ProfileScreenPage> createState() => _ProfileScreenPageState();
}

class _ProfileScreenPageState extends State<ProfileScreenPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Profile Screen Page',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
