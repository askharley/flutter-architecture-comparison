import 'package:flutter_architecture_comparison/src/core/locator.dart';
import 'package:flutter_architecture_comparison/src/core/models/post.dart';
import 'package:flutter_architecture_comparison/src/core/services/repository.dart';
import 'package:flutter_architecture_comparison/src/architectures/scoped_model/scoped_models/base_model.dart';

class PostsScopedModel extends BaseModel {
  Repository _repository = locator<Repository>();

  bool _isLoading = false;
  List<Post> _posts;

  bool get isLoading => _isLoading;
  List<Post> get posts => _posts;

  int getCount() {
    return _posts.length;
  }

  Future<List<Post>> getPosts() async {
    _isLoading = true;
    _posts = await _repository.getPosts();
    _isLoading = false;

    notifyListeners();
  }
}
