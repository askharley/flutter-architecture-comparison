import 'dart:convert';
import 'package:flutter_architecture_comparison/src/core/models/post.dart';
import 'package:http/http.dart' as http;

class Repository {
  final url = 'https://jsonplaceholder.typicode.com/posts?userId=1';

  var client = new http.Client();

  Future<List<Post>> getPosts() async {
    await Future.delayed(Duration(seconds: 2));

    var posts = List<Post>();

    var response = await client.get(url);

    var data = json.decode(response.body) as List<dynamic>;

    for (var post in data) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }
}