import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_architecture_comparison/src/core/models/post.dart';
import 'package:flutter_architecture_comparison/src/core/services/repository.dart';
import 'package:flutter_architecture_comparison/src/core/widgets/loading_indicator.dart';
import 'package:flutter_architecture_comparison/src/core/widgets/posts_list.dart';

class VanillaScreen extends StatefulWidget {
  Repository _repository = Repository();
  VanillaScreen(this._repository);

  @override
  State<StatefulWidget> createState() => _VanillaScreenState();
}

class _VanillaScreenState extends State<VanillaScreen> {
  bool _isLoading = true;
  List<Post> _posts;

  @override
  initState() {
    super.initState();
    widget._repository.getPosts().then((data) {
      setState(() {
        _isLoading = false;
        _posts = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text('Vanilla'), backgroundColor: Colors.redAccent),
        body: _isLoading ? loadingIndicator() : postsList(_posts));
  }
}
