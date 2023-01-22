import 'dart:convert';

import 'package:chat_app/model/comment.dart';
import 'package:chat_app/model/topic.dart';
import 'package:chat_app/source/comment_source.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../model/user.dart';

class CComment extends ChangeNotifier {
  List<Comment> _comments = [];
  List<Comment> get comments => _comments;
  setComments(Topic topic) async {
    _image = ' ';
    _comments = await CommentSource.read(topic.id);
    setReplyTo(topic.user!);
    notifyListeners();
  }

  User? _replyTo;
  User? get replyTo => _replyTo;
  setReplyTo(User user) {
    _replyTo = user;
    notifyListeners();
  }

  String _image = '';
  String get image => _image;

  String _imageBase64codes = '';
  String get imageBase64codes => _imageBase64codes;

  pickImage(ImageSource source) async {
    XFile? result = await ImagePicker().pickImage(source: source);
    if (result != null) {
      _image = result.name;
      _imageBase64codes = base64Encode(await result.readAsBytes());
      notifyListeners();
    }
  }
}
