import 'package:flutter/material.dart';
import 'package:my_first_app/screen_third.dart';

class ScreenFirst extends StatefulWidget {
  const ScreenFirst({super.key});

  @override
  State<ScreenFirst> createState() => _ScreenFirstState();
}

class _ScreenFirstState extends State<ScreenFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Screen First Page',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const Text(
            'Hi: Jhon Deo',
            style: TextStyle(fontSize: 30),
          ),
          const Text(
            'Heading 1',
            style: TextStyle(fontSize: 30),
          ),
          const Text(
            'Heading 2',
            style: TextStyle(fontSize: 30),
          ),
          const Text(
            'Heading 3',
            style: TextStyle(fontSize: 30),
          ),
          const Text(
            'Heading 4',
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenThird()),
                );
              },
              child: const Text('Sbmit'))
        ],
      ),
    );
  }
}
