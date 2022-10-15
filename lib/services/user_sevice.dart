import 'dart:convert';

import 'package:app_ecom_buidlagga/models/user_edit_from_model.dart';
import 'package:app_ecom_buidlagga/services/auth_sevice.dart';
import 'package:app_ecom_buidlagga/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthSevices().getToken();

      final res = await http
          .put(Uri.parse('$baseUrl/users'), body: data.toJson(), headers: {
        'Authorization': token,
      });
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {}
  }
}
