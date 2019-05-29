import 'package:flutter/material.dart';
import 'package:flutter_architecture_comparison/src/architectures/scoped_model/scoped_models/posts_model.dart';
import 'package:flutter_architecture_comparison/src/core/widgets/loading_indicator.dart';
import 'package:flutter_architecture_comparison/src/core/widgets/posts_list.dart';
import 'package:scoped_model/scoped_model.dart';

class PostsScopedView extends StatefulWidget {
  @override
  _PostsScopedViewState createState() => _PostsScopedViewState();
}

class _PostsScopedViewState extends State<PostsScopedView> {
  PostsScopedModel model;

  void initState() {
    super.initState();
    model = PostsScopedModel();
    model.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Scoped Model'), backgroundColor: Colors.amberAccent),
        body: ScopedModel<PostsScopedModel>(
            model: model,
            child: ScopedModelDescendant<PostsScopedModel>(
                builder: (context, _, model) => model.posts == null
                    ? loadingIndicator()
                    : postsList(model.posts))));
  }
}
