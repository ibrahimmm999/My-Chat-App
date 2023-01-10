import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:http/http.dart' as http;

import '../config/api.dart';
import '../model/user.dart';

class FollowSource {
  static Future<bool> checkIsFollowing(
    String fromIdUser,
    String toIdUser,
  ) async {
    String url = '${Api.follow}/check.php';
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'from_id_user': fromIdUser,
        'to_id_user': toIdUser,
      });
      DMethod.printTitle('Follow source - checkIsFollowing', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle('Follow source - checkIsFollowing', e.toString());
      return false;
    }
  }

  static Future<bool> following(
    String fromIdUser,
    String toIdUser,
  ) async {
    String url = '${Api.follow}/following.php';
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'from_id_user': fromIdUser,
        'to_id_user': toIdUser,
      });
      DMethod.printTitle('Follow source - following', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle('Follow source - following', e.toString());
      return false;
    }
  }

  static Future<bool> unFollowing(
    String fromIdUser,
    String toIdUser,
  ) async {
    String url = '${Api.follow}/unfollow.php';
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'from_id_user': fromIdUser,
        'to_id_user': toIdUser,
      });
      DMethod.printTitle('Follow source - unFollowing', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle('Follow source - unFollowing', e.toString());
      return false;
    }
  }

  static Future<List<User>> readFollower(String idUser) async {
    String url = '${Api.follow}/read_follower.php';
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'id_user': idUser,
      });
      DMethod.printTitle('Follow source - readFollower', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        List<User> listUser = list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return User.fromJson(item);
        }).toList();
        return listUser;
      }
      return [];
    } catch (e) {
      DMethod.printTitle('Follow source - readFollower', e.toString());
      return [];
    }
  }

  static Future<List<User>> readFollowing(String idUser) async {
    String url = '${Api.follow}/read_following.php';
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'id_user': idUser,
      });
      DMethod.printTitle('Follow source - readFollowing', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        List<User> listUser = list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return User.fromJson(item);
        }).toList();
        return listUser;
      }
      return [];
    } catch (e) {
      DMethod.printTitle('Follow source - readFollowing', e.toString());
      return [];
    }
  }
}
