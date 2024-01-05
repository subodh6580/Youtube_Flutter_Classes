import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('HomePage: Engineer Malaysia Wala'),
      ),
      body: Center(
          child: Column(
        children: [
          //Image.network('https://picsum.photos/250?image=9'),
          const Image(image: AssetImage('assets/logo/logo.JPG')),
          const Text(
            'Breaking News',
            style: TextStyle(fontSize: 50),
          ),
        ],
      )),
    );
  }
}
