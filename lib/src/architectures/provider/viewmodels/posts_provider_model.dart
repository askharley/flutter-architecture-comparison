import 'package:flutter_architecture_comparison/src/core/locator.dart';
import 'package:flutter_architecture_comparison/src/core/models/post.dart';
import 'package:flutter_architecture_comparison/src/core/services/repository.dart';
import 'package:flutter_architecture_comparison/src/architectures/provider/viewmodels/base_model.dart';
import 'package:flutter_architecture_comparison/src/architectures/provider/enums/enums.dart';

class PostsProviderModel extends BaseModel {
  Repository _repository = locator<Repository>();
  List<Post> posts;

  Future getPosts() async {
    setState(ViewState.Busy);
    posts = await _repository.getPosts();
    setState(ViewState.Idle);
  }
}