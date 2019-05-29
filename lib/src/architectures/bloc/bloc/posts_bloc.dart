import 'package:bloc/bloc.dart';
import 'package:flutter_architecture_comparison/src/core/services/repository.dart';
import 'package:flutter_architecture_comparison/src/architectures/bloc/bloc/posts_event.dart';
import 'package:flutter_architecture_comparison/src/architectures/bloc/bloc/posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final Repository _repository;

  PostsBloc(this._repository);

  @override
  PostsState get initialState => PostsLoading();

  @override
  Stream<PostsState> mapEventToState(PostsEvent event) async* {
    if (event is PostsScreenInitialized) {
      try {
        final posts = await _repository.getPosts();
        yield PostsLoaded(posts: posts);
      } catch (_) {
        yield PostsFailed();
      }
    }
  }
}
