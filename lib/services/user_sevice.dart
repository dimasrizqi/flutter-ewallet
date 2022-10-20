import 'dart:convert';

import 'package:app_ecom_buidlagga/models/user_edit_from_model.dart';
import 'package:app_ecom_buidlagga/services/auth_sevice.dart';
import 'package:app_ecom_buidlagga/shared/shared_values.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

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
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getRecentUsers() async {
    try {
      final token = await AuthSevices().getToken();
      final res = await http.get(
        Uri.parse(
          "$baseUrl/transfer_histories",
        ),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<UserModel>.from(
          jsonDecode(res.body)['data'].map(
            (user) => UserModel.fromJson(user),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getRecentUsersByUserName(String username) async {
    try {
      final token = await AuthSevices().getToken();
      final res = await http.get(
        Uri.parse(
          "$baseUrl/users/$username",
        ),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<UserModel>.from(
          jsonDecode(res.body).map(
            (user) => UserModel.fromJson(user),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
