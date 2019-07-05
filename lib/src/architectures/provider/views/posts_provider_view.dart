import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_comparison/src/core/widgets/loading_indicator.dart';
import 'package:flutter_architecture_comparison/src/core/widgets/posts_list.dart';
import 'package:flutter_architecture_comparison/src/architectures/provider/viewmodels/posts_provider_model.dart';
import 'package:flutter_architecture_comparison/src/architectures/provider/views/base_view.dart';

class PostsProviderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<PostsProviderModel>(
        onModelReady: (model) => model.getPosts(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
                title: Text('Provider'), backgroundColor: Colors.tealAccent),
            body: model.busy
                ? loadingIndicator()
                : postsList(model.posts)));
  }
}