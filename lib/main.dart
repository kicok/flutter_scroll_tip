import 'package:flutter/material.dart';
import 'package:flutter_scroll_tip/pages/keyboard_avoidding.dart';
import 'package:flutter_scroll_tip/pages/listview_only.dart';
import 'package:flutter_scroll_tip/pages/primary_scroll.dart';
import 'package:flutter_scroll_tip/pages/shirink_wrap.dart';
import 'package:flutter_scroll_tip/pages/using_expanded.dart';
import 'package:flutter_scroll_tip/pages/using_sliver_list.dart';
import 'package:flutter_scroll_tip/widgets/my_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Scroll Tips',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Scroll Tips'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MyButton(
              btnTitle: 'Using Expanded',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UsingExpanded();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 10.0),
            MyButton(
              btnTitle: 'Using ListView only',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ListViewOnly();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 10.0),
            MyButton(
              btnTitle: 'Primary Scroll',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PrimaryScroll();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 10.0),
            MyButton(
              btnTitle: 'SliverList',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UsingSliverList();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 10.0),
            MyButton(
              btnTitle: 'ShrinkWrap',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ShrinkWrapEx();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 10.0),
            MyButton(
              btnTitle: 'Keyboard Avoidding',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return KeyboardAvodding();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
