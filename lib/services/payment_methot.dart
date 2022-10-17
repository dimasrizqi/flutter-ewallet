import 'dart:convert';

import 'package:app_ecom_buidlagga/models/payment_methot_model.dart';
import 'package:app_ecom_buidlagga/services/auth_sevice.dart';
import 'package:http/http.dart' as http;

import '../shared/shared_values.dart';

class PaymenMethodSevice {
  Future<List<PaymentMethodModel>> getPaymenteMethods() async {
    try {
      final token = await AuthSevices().getToken();
      final res =
          await http.get(Uri.parse('$baseUrl/payment_methods'), headers: {
        'Authorization': token,
      });

      if (res.statusCode == 200) {
        return List<PaymentMethodModel>.from(jsonDecode(res.body).map(
                (paymentMethod) => PaymentMethodModel.fromJson(paymentMethod)))
            .toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
