import 'package:flutter/material.dart';

class ScreenThird extends StatefulWidget {
  const ScreenThird({super.key});

  @override
  State<ScreenThird> createState() => _ScreenThirdState();
}

class _ScreenThirdState extends State<ScreenThird> {
  final List<Map<String, String>> listOfData = [
    {"Name": 'AAAAAA', "Number": "1", "State": "Yes"},
    {"Name": "BBBBBB", "Number": "2", "State": "no"},
    {"Name": "CCCCCC", "Number": "3", "State": "Yes"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Screen Third Page',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Name',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Age',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Role',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Sarah')),
                  DataCell(Text('19')),
                  DataCell(Text('Student')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Janine')),
                  DataCell(Text('43')),
                  DataCell(Text('Professor')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('William')),
                  DataCell(Text('27')),
                  DataCell(Text('Associate Professor')),
                ],
              ),
            ],
          ),
          const Divider(
            height: 20,
          ),
          const Text(
            'Second DataTable',
            style: TextStyle(fontSize: 20),
          ),
          DataTable(columns: const <DataColumn>[
            DataColumn(label: Text('Sr No')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Salary')),
          ], rows: const [
            DataRow(
              cells: <DataCell>[
                DataCell(Text('1')),
                DataCell(Text('Jhon Deo')),
                DataCell(Text('50000/-')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('1')),
                DataCell(Text('Ram')),
                DataCell(Text('50000/-')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('1')),
                DataCell(Text('Tony')),
                DataCell(Text('50000/-')),
              ],
            ),
          ]),
          const Divider(),
          const Text(
            '3rd DataTable',
            style: TextStyle(fontSize: 20),
          ),
          DataTable(
            columns: const [
              DataColumn(label: Text('Sr No')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Salary')),
            ],
            rows:
                listOfData // Loops through dataColumnText, each iteration assigning the value to element
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text(element["Name"] ??
                                  'HardCodes')), //Extracting from Map element the value
                              DataCell(Text(element["Number"] ?? '')),
                              DataCell(Text(element["State"] ?? '')),
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
