import 'dart:convert';

import 'package:app_ecom_buidlagga/models/oprator_card_model.dart';
import 'package:app_ecom_buidlagga/services/auth_sevice.dart';
import 'package:app_ecom_buidlagga/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class OpratorCardService {
  Future<List<OpratorCardModel>> getOpratorCards() async {
    try {
      final token = await AuthSevices().getToken();
      final res = await http.get(
        Uri.parse(
          '$baseUrl/operator_cards',
        ),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<OpratorCardModel>.from(jsonDecode(res.body)['data'].map(
          (opratorCard) => OpratorCardModel.fromJson(opratorCard),
        )).toList();
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
