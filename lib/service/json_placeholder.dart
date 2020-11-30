import 'dart:convert';

import 'package:flutter_scroll_tip/models/post.dart';
import 'package:http/http.dart' as http;

class JsonPlaceholder {
  static Future<List<Post>> getPosts() async {
    try {
      final response =
          await http.get('http://jsonplaceholder.typicode.com/posts');
      final responseBody = json.decode(response.body);

      final List<Post> posts =
          responseBody.map<Post>((json) => Post.fromJson(json)).toList();
      return posts;
    } catch (err) {
      print(err);
      throw err;
    }
  }
}
