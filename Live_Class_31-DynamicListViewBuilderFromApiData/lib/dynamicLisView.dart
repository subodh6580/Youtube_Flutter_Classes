import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DynamicListViewPage extends StatefulWidget {
  const DynamicListViewPage({super.key});

  @override
  State<DynamicListViewPage> createState() => _DynamicListViewPageState();
}

class _DynamicListViewPageState extends State<DynamicListViewPage> {
  @override
  void initState() {
    callUserListFromApi();
    super.initState();
  }

  List allUsersList = [];

  callUserListFromApi() async {
    final apiClient = Dio();
    try {
      final response = await apiClient
          .get('https://reqres.in/api/users?page=1&per_page=122');
      if (response.statusCode == 200) {
        setState(() {
          allUsersList = response.data['data'];
          print("List $allUsersList");
        });

        print("InSideSide: ${response.data['data']}");
      } else {
        print("OutSide: ${response.data}");
      }
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dymanic Table'),
      ),
      body: allUsersList.length > 0
          ? Column(children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: allUsersList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                        allUsersList[index]['avatar']),
                                    Column(
                                      children: [
                                        Text('Profile'),
                                        Text(
                                            "${allUsersList[index]['first_name']} ${allUsersList[index]['last_name']}"),
                                        Text("${allUsersList[index]['email']}"),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
            ])
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
