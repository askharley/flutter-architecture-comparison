import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_architecture_comparison/src/core/models/post.dart';

Widget postsList(List<Post> posts) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, i) => Column(children: <Widget>[
            ListTile(
                title: Text(posts[i].title,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(posts[i].body,
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                onTap: () =>
                    Navigator.pushNamed(context, '/post', arguments: posts[i]))
          ]));
}
