import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CallGetApiPage extends StatefulWidget {
  const CallGetApiPage({super.key});

  @override
  State<CallGetApiPage> createState() => _CallGetApiPageState();
}

class _CallGetApiPageState extends State<CallGetApiPage> {
  List allUserList = [];
  @override
  void initState() {
    callingGetApi();
    super.initState();
  }

  callingGetApi() async {
    final apiClient = Dio(); //API_CLIENT
    try {
      final apiResponse =
          await apiClient.get('https://reqres.in/api/users?page=2');
      if (apiResponse.statusCode == 200) {
        print("InSide $apiResponse");
        setState(() {
          allUserList = apiResponse.data['data'];
        });
      } else {
        print("OutSide $apiResponse");
        //print('${apiResult.statusCode} : ${apiResult.data.toString()}');
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALLING GET REST API'),
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
                          "${allUserList[index]['first_name']} ${allUserList[index]['first_name']} ${allUserList[index]['last_name']}"),
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
