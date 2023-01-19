import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:http/http.dart' as http;

import '../config/api.dart';

class CommentSource {
  static Future<bool> create(
    String idTopic,
    String description,
    String image,
    String fromIdUser,
    String toIdUser,
    String base64code,
  ) async {
    String url = '${Api.comment}/create.php';
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'id_topic': idTopic,
        'description': description,
        'image': image,
        'from_id_user': fromIdUser,
        'to_id_user': toIdUser,
        'base64code': base64code,
      });
      DMethod.printTitle('Comment source - create', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle('Comment source - create', e.toString());
      return false;
    }
  }

  static Future<bool> delete(String id, String image) async {
    String url = '${Api.comment}/delete.php';
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'id': id,
        'image': image,
      });
      DMethod.printTitle('Comment source - delete', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle('Comment source - delete', e.toString());
      return false;
    }
  }
}
