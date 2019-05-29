import 'package:flutter/foundation.dart';
import 'package:flutter_architecture_comparison/src/architectures/provider/enums/enums.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}