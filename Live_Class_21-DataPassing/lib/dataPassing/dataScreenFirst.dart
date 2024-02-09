import 'package:flutter/material.dart';
import 'package:my_first_app/dataPassing/dataScreen2nd.dart';
//import 'package:my_first_app/homepage.dart';

class dataScreenFirstPage extends StatefulWidget {
  @override
  State<dataScreenFirstPage> createState() => _dataScreenFirstPageState();
}

class _dataScreenFirstPageState extends State<dataScreenFirstPage> {
  String myChannelName = 'Engineer Malaysia Wala';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Data Screen First',
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => dataScreen2ndPage(
                            channelName: myChannelName,
                            channelID: 1222,
                            channelOwner2: 'Jhon Deo',
                          )),
                );
              },
              child: const Text('Click me'))
        ],
      )),
    );
  }
}
