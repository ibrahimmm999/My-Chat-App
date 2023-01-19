import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:http/http.dart' as http;

import '../config/api.dart';
import '../model/topic.dart';

class TopicSource {
  static Future<bool> create(
    String title,
    String description,
    String images,
    String idUser,
    String base64codes,
  ) async {
    String url = '${Api.topic}/create.php';
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'title': title,
        'description': description,
        'images': images,
        'id_user': idUser,
        'base64codes': base64codes,
      });
      DMethod.printTitle('Topic source - create', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle('Topic source - create', e.toString());
      return false;
    }
  }

  static Future<bool> update(
    String id,
    String title,
    String description,
  ) async {
    String url = '${Api.topic}/update.php';
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'id': id,
        'title': title,
        'description': description,
      });
      DMethod.printTitle('Topic source - update', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle('Topic source - update', e.toString());
      return false;
    }
  }

  static Future<bool> delete(String id, String images) async {
    String url = '${Api.topic}/delete.php';
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'id': id,
        'images': images,
      });
      DMethod.printTitle('Topic source - delete', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle('Topic source - delete', e.toString());
      return false;
    }
  }

  static Future<List<Topic>> readExplore() async {
    String url = '${Api.topic}/read_explore.php';
    try {
      http.Response response = await http.get(Uri.parse(url));
      DMethod.printTitle('Topic source - readExplore', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        List<Topic> listTopic = list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return Topic.fromJson(item);
        }).toList();
        return listTopic;
      }
      return [];
    } catch (e) {
      DMethod.printTitle('Topic source - readExplore', e.toString());
      return [];
    }
  }

  static Future<List<Topic>> readFeed(String idUser) async {
    String url = '${Api.topic}/read_feed.php';
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'id_user': idUser,
      });
      DMethod.printTitle('Topic source - readFeed', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        List<Topic> listTopic = list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return Topic.fromJson(item);
        }).toList();
        return listTopic;
      }
      return [];
    } catch (e) {
      DMethod.printTitle('Topic source - readFeed', e.toString());
      return [];
    }
  }
}
