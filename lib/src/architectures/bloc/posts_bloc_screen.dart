import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_architecture_comparison/src/core/services/repository.dart';
import 'package:flutter_architecture_comparison/src/core/widgets/failed_text.dart';
import 'package:flutter_architecture_comparison/src/core/widgets/loading_indicator.dart';
import 'package:flutter_architecture_comparison/src/core/widgets/posts_list.dart';
import 'package:flutter_architecture_comparison/src/architectures/bloc/bloc/bloc.dart';

import 'bloc/posts_state.dart';

class PostsBlocScreen extends StatefulWidget {
  @override
  _PostsBlocScreenState createState() => _PostsBlocScreenState();
}

class _PostsBlocScreenState extends State<PostsBlocScreen> {
  final Repository _repository = Repository();
  PostsBloc _postsBloc;

  @override
  initState() {
    super.initState();
    _postsBloc = PostsBloc(_repository);
    _postsBloc.dispatch(PostsScreenInitialized());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('BLoC'), backgroundColor: Colors.blueAccent),
        body: BlocBuilder(
          bloc: _postsBloc,
          builder: (BuildContext context, PostsState state) {
            if (state is PostsLoading) {
              return loadingIndicator();
            }
            if (state is PostsLoaded) {
              return postsList(state.posts);
            }
            if (state is PostsFailed) {
              return failedText();
            }
          },
        ));
  }

  @override
  void dispose() {
    _postsBloc.dispose();
    super.dispose();
  }
}
