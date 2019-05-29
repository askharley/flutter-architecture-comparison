import 'package:flutter_architecture_comparison/src/core/models/post.dart';

abstract class PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Post> posts;

  PostsLoaded({this.posts});
}

class PostsFailed extends PostsState {}
