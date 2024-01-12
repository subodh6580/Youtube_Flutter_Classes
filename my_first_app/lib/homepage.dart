import 'package:flutter/material.dart';
import 'package:my_first_app/home_screen_page.dart';
import 'package:my_first_app/change_password_page.dart';
import 'package:my_first_app/profile_screen_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> pageList = <Widget>[
    ProfileScreenPage(), //INDEX = 0
    HomeScreenPage(), //INDEX = 1
    ChangePasswordPage() //INDEX = 2
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('HomePage: Engineer Malaysia Wala'),
      ),
      body: Center(
        child: pageList[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('User Profile Image'),
            ),
            ListTile(
              selectedTileColor: Colors.red,
              title: const Text('Profile'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              selectedTileColor: Colors.red,
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              selectedTileColor: Colors.red,
              title: const Text('Change Password'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
