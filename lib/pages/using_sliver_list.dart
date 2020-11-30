import 'package:flutter/material.dart';
import 'package:flutter_scroll_tip/models/post.dart';
import 'package:flutter_scroll_tip/service/json_placeholder.dart';
import 'package:flutter_scroll_tip/widgets/header.dart';

class UsingSliverList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using SliverList'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Header()),
          FutureBuilder(
            future: JsonPlaceholder.getPosts(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        '${snapshot.error}',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = snapshot.data[index];
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
                    childCount: snapshot.data.length,
                  ),
                );
              } else {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
