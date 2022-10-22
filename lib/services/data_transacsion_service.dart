import 'dart:convert';

import 'package:app_ecom_buidlagga/models/data_palan_model.dart';
import 'package:app_ecom_buidlagga/models/data_plan_from_model.dart';
import 'package:app_ecom_buidlagga/models/top_up_model.dart';
import 'package:app_ecom_buidlagga/models/transaction_model.dart';
import 'package:app_ecom_buidlagga/services/auth_sevice.dart';
import 'package:app_ecom_buidlagga/shared/shared_values.dart';
import 'package:http/http.dart' as http;

import '../models/tranfer_from_model.dart';

class TransaionService {
  Future<String> topUp(TopFromModel data) async {
    try {
      final token = await AuthSevices().getToken();
      final res = await http.post(Uri.parse('$baseUrl/top_ups'),
          headers: {
            'Authorization': token,
          },
          body: data.toJson());

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> tranfer(TransferFormModel data) async {
    try {
      final token = await AuthSevices().getToken();
      final res = await http.post(Uri.parse('$baseUrl/transfers'),
          headers: {
            'Authorization': token,
          },
          body: data.toJson());

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> dataPlan(DataPlanFormModel data) async {
    try {
      final token = await AuthSevices().getToken();
      final res = await http.post(
          Uri.parse(
            '$baseUrl/data_plans',
          ),
          headers: {
            'Authorization': token,
          },
          body: data.toJson());

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransacsionFromModel>> getTransacsionactioms() async {
    try {
      final token = await AuthSevices().getToken();

      final res = await http.get(
        Uri.parse(
          "$baseUrl/transactions",
        ),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode == 200) {
        return List<TransacsionFromModel>.from(
          jsonDecode(res.body)['data'].map(
            (transacsion) => TransacsionFromModel.fromJson(transacsion),
          ),
        ).toList();
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
