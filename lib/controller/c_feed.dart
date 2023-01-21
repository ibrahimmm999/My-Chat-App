import 'package:chat_app/model/topic.dart';
import 'package:flutter/foundation.dart';

import '../source/topic_source.dart';

class CFeed extends ChangeNotifier {
  List<Topic> _topics = [];
  List<Topic> get topics => _topics;

  setTopics(String idUser) async {
    _topics = await TopicSource.readFeed(idUser);
    notifyListeners();
  }
}
