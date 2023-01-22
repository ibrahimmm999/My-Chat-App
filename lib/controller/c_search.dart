import 'package:chat_app/model/topic.dart';
import 'package:chat_app/model/user.dart';
import 'package:chat_app/source/topic_source.dart';
import 'package:flutter/cupertino.dart';

import '../source/user_source.dart';

class CSearch extends ChangeNotifier {
  List<String> get filters => ['Topic', 'User'];

  String _filter = 'Topic';
  String get filter => _filter;
  set filter(String newFilter) {
    _filter = newFilter;
    notifyListeners();
  }

  search(String query) {
    if (filter == 'Topic') {
    } else {}
  }

  List<Topic> _topics = [];
  List<Topic> get topics => _topics;
  setTopics(String query) async {
    _topics = await TopicSource.search(query);
    notifyListeners();
  }

  List<User> _users = [];
  List<User> get users => _users;
  setusers(String query) async {
    _users = await UserSource.search(query);
    notifyListeners();
  }
}
