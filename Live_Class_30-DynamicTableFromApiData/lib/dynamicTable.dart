import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DynamicTablePage extends StatefulWidget {
  const DynamicTablePage({super.key});

  @override
  State<DynamicTablePage> createState() => _DynamicTablePageState();
}

class _DynamicTablePageState extends State<DynamicTablePage> {
  @override
  void initState() {
    callUserListFromApi();
    super.initState();
  }

  List listOfColumns = [];

  callUserListFromApi() async {
    final apiClient = Dio();
    try {
      final response = await apiClient
          .get('https://reqres.in/api/users?page=1&per_page=1000000');
      if (response.statusCode == 200) {
        setState(() {
          listOfColumns = response.data['data'];
          print("List $listOfColumns");
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
      body: Column(
        children: [
          DataTable(
            columns: const [
              DataColumn(label: Text('Sr')),
              DataColumn(label: Text('FName')),
              DataColumn(label: Text('LName')),
              DataColumn(label: Text('Email')),
            ],
            rows:
                listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text("${element['id']}")),
                              DataCell(Text("${element['first_name']}")),
                              DataCell(Text("${element['last_name']}")),
                              DataCell(Text("${element['email']}")),
                            ],
                          )),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
