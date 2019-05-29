import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_architecture_comparison/src/architectures/provider/enums/enums.dart';
import 'package:flutter_architecture_comparison/src/core/locator.dart';
import 'package:flutter_architecture_comparison/src/core/models/post.dart';
import 'package:flutter_architecture_comparison/src/core/services/repository.dart';

class PostsScopedModel extends Model {
  Repository _repository = locator<Repository>();
  ViewState _state;
  bool _isLoading = false;
  List<Post> _posts;

  ViewState get state => _state;
  bool get isLoading => _isLoading;
  List<Post> get posts => _posts;

  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }

  void getPosts() async {
    _isLoading = true;
    _posts = await _repository.getPosts();
    _isLoading = false;

    notifyListeners();
  }
}
