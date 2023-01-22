import 'package:chat_app/source/follow_source.dart';
import 'package:flutter/foundation.dart';

import '../model/user.dart';

class CFollowing extends ChangeNotifier {
  List<User> _list = [];
  List<User> get list => _list;

  setList(String idUser) async {
    _list = await FollowSource.readFollowing(idUser);
    notifyListeners();
  }
}
