import 'package:flutter_architecture_comparison/src/core/locator.dart';
import 'package:flutter_architecture_comparison/src/core/models/post.dart';
import 'package:flutter_architecture_comparison/src/core/services/repository.dart';
import 'package:flutter_architecture_comparison/src/architectures/provider/viewmodels/base_model.dart';

class PostsProviderModel extends BaseModel {
  Repository _repository = locator<Repository>();
  List<Post> posts;

  Future getPosts() async {
    setBusy(true);
    posts = await _repository.getPosts();
    setBusy(false);
  }
}