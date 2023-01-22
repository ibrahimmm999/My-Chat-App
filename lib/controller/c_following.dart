import 'package:chat_app/source/follow_source.dart';
import 'package:flutter/foundation.dart';

import '../model/user.dart';

class CFollowing extends ChangeNotifier {
  List<User> _users = [];
  List<User> get users => _users;

  setUsers(String idUser) async {
    _users = await FollowSource.readFollowing(idUser);
    notifyListeners();
  }
}
