import 'dart:convert';

import 'package:app_ecom_buidlagga/models/tip_model.dart';
import 'package:app_ecom_buidlagga/services/auth_sevice.dart';
import 'package:app_ecom_buidlagga/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TipSevice {
  Future<List<TipFromModel>> getTips() async {
    try {
      final token = await AuthSevices().getToken();

      final res = await http.get(
        Uri.parse(
          '$baseUrl/tips',
        ),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        List<TipFromModel> tips = List<TipFromModel>.from(
          jsonDecode(res.body)['data'].map(
            (tip) => TipFromModel.fromJson(tip),
          ),
        ).toList();

        return tips;
      }
      return throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
