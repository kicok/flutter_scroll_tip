import 'package:flutter/material.dart';

class ShrinkWrapEx extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'key': 'item1', 'value': 'description 1'},
    {'key': 'item2', 'value': 'description 2'},
    {'key': 'item3', 'value': 'description 3'},
    {'key': 'item4', 'value': 'description 4'},
    {'key': 'item5', 'value': 'description 5'},
    {'key': 'item6', 'value': 'description 6'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShrinkWrap'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: ListView.builder(
            shrinkWrap: false,
            itemCount: items.length,
            itemBuilder: (context, idx) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(idx.toString()),
                  ),
                  title: Text(items[idx]['key']),
                  subtitle: Text(items[idx]['value']),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
