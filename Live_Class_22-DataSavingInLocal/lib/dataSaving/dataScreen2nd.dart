// ignore: file_names
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dataScreen2ndPage extends StatefulWidget {
  dataScreen2ndPage({
    super.key,
  });

  @override
  State<dataScreen2ndPage> createState() => _dataScreen2ndPageState();
}

class _dataScreen2ndPageState extends State<dataScreen2ndPage> {
  String userName = '';

  @override
  void initState() {
    fetchLocalData();
    super.initState();
  }

  fetchLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? '';
    });
    print(prefs.getString('userName'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondScreen DataFetching'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Data Fetching Screen',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'UserName: ${userName}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}
