import 'package:flutter/material.dart';
import 'package:my_first_app/screen_third.dart';

class ExpantionPanel extends StatefulWidget {
  const ExpantionPanel({super.key});

  @override
  State<ExpantionPanel> createState() => _ExpantionPanelState();
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      id: index,
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class _ExpantionPanelState extends State<ExpantionPanel> {
  final List<Item> _data = generateItems(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Expantion Panel',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Expantion Tiles',
                  style: TextStyle(fontSize: 30),
                ),
                const ExpansionTile(
                  title: Text('Car List'),
                  subtitle: Text('All new cars'),
                  children: <Widget>[
                    ListTile(title: Text('Car 1')),
                    ListTile(title: Text('Car 2')),
                    ListTile(title: Text('Car 3')),
                    ListTile(title: Text('Car 4')),
                  ],
                ),
                const ExpansionTile(
                  collapsedBackgroundColor: Colors.grey,
                  backgroundColor: Colors.amber,
                  //trailing: Icon(Icons.arrow_back_ios_sharp),
                  title: Text('Byke List'),
                  subtitle: Text('All new bykes'),
                  children: <Widget>[
                    ListTile(title: Text('Byke 1')),
                    ListTile(title: Text('Byke 2')),
                    ListTile(title: Text('Byke 3')),
                    ListTile(title: Text('Byke 4')),
                  ],
                ),
                const ExpansionTile(
                  title: Text('List of Books'),
                  subtitle: Text('Engineering Books'),
                  children: [
                    ListTile(
                      title: Text('Book 1'),
                    ),
                    ListTile(
                      title: Text('Book 2'),
                    ),
                    ListTile(
                      title: Text('Book 3'),
                    )
                  ],
                ),
                Divider(),
                const Text(
                  'Expantion Panel List',
                  style: TextStyle(fontSize: 30),
                ),
                ExpansionPanelList.radio(
                  elevation: 1,
                  initialOpenPanelValue: 2,
                  children: _data.map<ExpansionPanelRadio>((Item item) {
                    return ExpansionPanelRadio(
                        value: item.id,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(item.headerValue),
                          );
                        },
                        body: ListTile(
                            title: Text(item.expandedValue),
                            subtitle: const Text(
                                'To delete this panel, tap the trash can icon'),
                            trailing: const Icon(Icons.delete),
                            onTap: () {
                              setState(() {
                                _data.removeWhere(
                                    (Item currentItem) => item == currentItem);
                              });
                            }));
                  }).toList(),
                ),
              ],
            ),
          ),
        ));
  }
}

class Item {
  Item({
    required this.id,
    required this.expandedValue,
    required this.headerValue,
  });

  int id;
  String expandedValue;
  String headerValue;
}
