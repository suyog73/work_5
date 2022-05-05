import 'package:flutter/foundation.dart';

class PositionProvider with ChangeNotifier {
  bool _isLeft = false;
  bool _isRight = false;

  bool get isLeft => _isLeft;

  bool get isRight => _isRight;

  void leftDrag() {
    print("leffffffffffff");
    _isLeft = true;
    _isRight = false;
    notifyListeners();
  }

  void rightDrag() {
    print("righhhhhhhhhhhh");
    _isRight = true;
    _isLeft = false;
    notifyListeners();
  }
}
