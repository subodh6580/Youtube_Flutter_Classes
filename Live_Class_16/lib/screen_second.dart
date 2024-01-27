import 'package:flutter/material.dart';

class ScreenSecond extends StatefulWidget {
  const ScreenSecond({super.key});

  @override
  State<ScreenSecond> createState() => _ScreenSecondState();
}

class _ScreenSecondState extends State<ScreenSecond> {
  final List listOfElements = [
    'A',
    'B',
    'C',
  ];
  final List<int> colorCodes = <int>[600, 500, 100];
  final String thisIsString = "String";
  int anyNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '2nd Screen ListView',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: listOfElements.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      child: Center(
                          child: Text(
                              'Youtube User ${listOfElements[index]} Index: ${index}')),
                    );
                  }),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: listOfElements.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.amber[colorCodes[index]],
                    child: Center(
                        child: Text('Youtube User ${listOfElements[index]}')),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            )
          ],
        ));
  }
}
