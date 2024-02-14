import 'package:flutter/material.dart';
import 'package:my_first_app/dataSaving/dataScreen2nd.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:my_first_app/homepage.dart';

class dataScreenFirstPage extends StatefulWidget {
  @override
  State<dataScreenFirstPage> createState() => _dataScreenFirstPageState();
}

class _dataScreenFirstPageState extends State<dataScreenFirstPage> {
  String myChannelName = 'Engineer Malaysia Wala';

  dataSaving() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userName", "Jhon Deo"); //SAVING DATA HERE

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => dataScreen2ndPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstScreen DataSaving'),
      ),
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
                dataSaving();
              },
              child: const Text('Click me'))
        ],
      )),
    );
  }
}
