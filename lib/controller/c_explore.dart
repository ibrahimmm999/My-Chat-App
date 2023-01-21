import 'package:chat_app/model/topic.dart';
import 'package:flutter/foundation.dart';

import '../source/topic_source.dart';

class CExplore extends ChangeNotifier {
  List<Topic> _topics = [];
  List<Topic> get topics => _topics;

  setTopics() async {
    _topics = await TopicSource.readExplore();
    notifyListeners();
  }
}
