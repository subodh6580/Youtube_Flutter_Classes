// ignore: file_names
import 'package:flutter/material.dart';

class dataScreen2ndPage extends StatefulWidget {
  dataScreen2ndPage(
      {super.key,
      this.channelName,
      this.channelID,
      required this.channelOwner2});

  String? channelName;
  int? channelID;
  String channelOwner2;

  @override
  State<dataScreen2ndPage> createState() => _dataScreen2ndPageState();
}

class _dataScreen2ndPageState extends State<dataScreen2ndPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Data Screen 2nd',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'My Channel ID: ${widget.channelID}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'My Channel Owner: ${widget.channelOwner2}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Channel Name: ${widget.channelName}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}
