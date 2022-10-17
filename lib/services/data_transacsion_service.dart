import 'dart:convert';

import 'package:app_ecom_buidlagga/models/top_up_model.dart';
import 'package:app_ecom_buidlagga/services/auth_sevice.dart';
import 'package:app_ecom_buidlagga/shared/shared_values.dart';
import 'package:http/http.dart' as https;

class TransaionService {
  Future<String> topUp(TopFromModel data) async {
    try {
      final token = await AuthSevices().getToken();
      final res = await https.post(Uri.parse('$baseUrl/top_ups'),
          headers: {
            'Authorization': token,
          },
          body: data.toJson());

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }

      return jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
