import 'package:chat_app/model/user.dart';
import 'package:flutter/foundation.dart';

class CUser extends ChangeNotifier {
  User? _data;
  User? get data => _data;
  set data(User? n) {
    _data = n;
    notifyListeners();
  }
}
