import 'package:flutter/material.dart';
import 'package:my_first_app/homepage.dart';

class LoginScreenPage extends StatefulWidget {
  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
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
                  Navigator.push(
                    context,
                    //MaterialPageRoute(builder: (context) => const MyHomePage()
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
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
