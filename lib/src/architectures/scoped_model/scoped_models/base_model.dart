import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_architecture_comparison/src/architectures/provider/enums/enums.dart';

class BaseModel extends Model {
  ViewState _state;
  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }
}