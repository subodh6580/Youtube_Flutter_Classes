import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CallPostApiPage extends StatefulWidget {
  const CallPostApiPage({super.key});

  @override
  State<CallPostApiPage> createState() => _CallPostApiPageState();
}

class _CallPostApiPageState extends State<CallPostApiPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  List allUserList = [];
  @override
  void initState() {
    super.initState();
  }

  callPostApi() async {
    //print("Name: ${nameController.text}");
    //print("Job: ${jobController.text}");

    var postData = {'name': nameController.text, 'job': jobController.text};

    final apiClient = Dio();
    try {
      final response =
          await apiClient.post('https://reqres.in/api/users', data: postData);
      if (response.statusCode == 201) {
        print("InSide: ${response.data}");
        final snackbar = SnackBar(
          backgroundColor: Colors.green,
          content: const Text('User created successfully'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      } else {
        print("OutSide: ${response.data}");
      }
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALL POST REST API Via FORM'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Name',
                  hintText: 'Enter your name'),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: TextFormField(
                controller: jobController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Job',
                    hintText: 'Enter your job title'),
              )),
          ElevatedButton(
              onPressed: () {
                //print(nameController.text);
                //print("JobTitle: ${jobController.text}");
                callPostApi();
              },
              child: Text('Submit'))
        ],
      ),
    );
  }
}
