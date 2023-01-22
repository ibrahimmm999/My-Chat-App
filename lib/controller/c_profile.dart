import 'package:chat_app/model/topic.dart';
import 'package:chat_app/source/user_source.dart';
import 'package:flutter/foundation.dart';

import '../source/topic_source.dart';

class CProfile extends ChangeNotifier {
  Map<String, dynamic> _stat = {
    "topic": 0.0,
    "following": 0.0,
    "followers": 0.0,
  };
  Map<String, dynamic> get stat => _stat;

  setStat(String idUser) async {
    _stat = await UserSource.stat(idUser);
    notifyListeners();
  }
}
