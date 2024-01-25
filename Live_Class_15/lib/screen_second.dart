import 'package:flutter/material.dart';

class ScreenSecond extends StatefulWidget {
  const ScreenSecond({super.key});

  @override
  State<ScreenSecond> createState() => _ScreenSecondState();
}

class _ScreenSecondState extends State<ScreenSecond> {
  final List listOfElements = [
    'Jhon',
    'Tony',
    'C',
    'D',
    'E',
    'F',
    'Jhon',
    'Tony',
    'C',
    'D',
    'E',
    'F',
    'Jhon',
    'Tony',
    'C',
    'D',
    'E',
    'F'
  ];
  final String thisIsString = "String";
  int anyNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Screen Second Page',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: listOfElements.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: Center(
                  child: Text('${listOfElements[index]} Index: ${index}')),
            );
          }),
    );
  }
}
