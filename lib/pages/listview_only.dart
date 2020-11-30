import 'package:flutter/material.dart';
import 'package:flutter_scroll_tip/models/post.dart';
import 'package:flutter_scroll_tip/service/json_placeholder.dart';
import 'package:flutter_scroll_tip/widgets/header.dart';

class ListViewOnly extends StatelessWidget {
  Widget buildHeader(Post item) {
    return Column(
      children: [
        Header(),
        ListTile(
          leading: CircleAvatar(
            child: Text(('1').toString()),
          ),
          title: Text(item.title),
          subtitle: Text(item.body),
        ),
        Divider(color: Colors.black38),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView only'),
      ),
      body: FutureBuilder(
        future: JsonPlaceholder.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error}',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final item = snapshot.data[index];
                if (index == 0) {
                  return buildHeader(item);
                }
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text((index + 1).toString()),
                      ),
                      title: Text(item.title),
                      subtitle: Text(item.body),
                    ),
                    Divider(color: Colors.black38),
                  ],
                );
              },
            );
          } else {
            return SizedBox(
              width: double.infinity,
              height: 100,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
