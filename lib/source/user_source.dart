import 'dart:convert';

import 'package:chat_app/config/api.dart';
import 'package:d_method/d_method.dart';
import 'package:http/http.dart' as http;

class UserSource {
  static Future<Map> register(String username, String password) async {
    String url = '${Api.user}/register.php';
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'username': username,
        'password': password,
      });
      DMethod.printTitle('User source - register', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      DMethod.printTitle('User source - register', e.toString());
      return {'success': false};
    }
  }

  static Future<Map> login(String username, String password) async {
    String url = '${Api.user}/login.php';
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'username': username,
        'password': password,
      });
      DMethod.printTitle('User source - login', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      DMethod.printTitle('User source - login', e.toString());
      return {'success': false};
    }
  }
}
