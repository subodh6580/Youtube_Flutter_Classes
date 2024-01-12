import 'package:flutter/material.dart';
//import 'package:my_first_app/homepage.dart';
import 'package:my_first_app/login_screen_page.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Change Password Screen Page',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
