import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DataScreenFirstPage extends StatefulWidget {
  const DataScreenFirstPage({super.key});

  @override
  State<DataScreenFirstPage> createState() => _DataScreenFirstPageState();
}

class _DataScreenFirstPageState extends State<DataScreenFirstPage> {
  @override
  void initState() {
    fetchApiData(); //CALL THIS FUNCTION PAGE/SCREEN ON LOAD
    super.initState();
  }

  final _dio = Dio(); //FOR API REQUEST
  List allUserList = [];

  fetchApiData() async {
    try {
      final response = await _dio.get('https://reqres.in/api/users?page=1');
      if (response.statusCode == 200) {
        print(response.data);
        //print();
        setState(() {
          allUserList = response.data['data'];
        });
        print("ALl UserList $allUserList");
      } else {}
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data from REST API'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: allUserList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                          "${allUserList[index]['first_name']} ${allUserList[index]['last_name']}"),
                      Text(allUserList[index]['email']),
                      Image.network(allUserList[index]['avatar'])
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
