// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/homepage.dart';

class LoginScreenPage extends StatefulWidget {
  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  checkLogin(loginData) async {
    //print(loginData);
    final dio = Dio();

    try {
      // 404
      final response = await dio.post(
        'https://nitsilchar.co.in/cinvonyosis_apiv1/login/managerlogin',
        data: loginData,
      );
      if (response.statusCode == 200) {
        print(response.data);
      }
    } on DioException catch (e) {
      var snackBar = const SnackBar(
          content: Text(
        'Login Failed!!',
        style: TextStyle(color: Colors.red),
      ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      if (e.response != null) {
      } else {
        print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Login',
            style: TextStyle(fontSize: 40),
          ),
          const Text(
            'Add your details to login',
            style: TextStyle(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintText: 'Enter a email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintText: 'Enter a password',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 280,
            height: 60,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                  var loginData = {
                    "submit": true,
                    "email": emailController.text,
                    "password": passwordController.text
                  };
                  checkLogin(loginData);
                  //print("Email: ${emailController.text}");
                  //print("Pwd: ${passwordController.text}");
                  // Navigator.push(
                  //   context,
                  //   //MaterialPageRoute(builder: (context) => const MyHomePage()
                  //   MaterialPageRoute(builder: (context) => MyHomePage()),
                  // );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot your password?',
                style: TextStyle(color: Colors.black),
              ))
        ],
      )),
    ));
  }
}
