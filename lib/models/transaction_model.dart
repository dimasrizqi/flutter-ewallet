import 'package:app_ecom_buidlagga/models/payment_methot_model.dart';
import 'package:app_ecom_buidlagga/models/tranfer_from_model.dart';
import 'package:app_ecom_buidlagga/models/transaction_type_model.dart';

class TransacsionFromModel {
  final int? id;
  final int? amount;
  final DateTime? createdAt;
  final PaymentMethodModel? paymentMethodModel;
  final TransactionTypeModel? transactionType;

  TransacsionFromModel({
    this.id,
    this.amount,
    this.createdAt,
    this.paymentMethodModel,
    this.transactionType,
  });

  factory TransacsionFromModel.fromJson(Map<String, dynamic> json) =>
      TransacsionFromModel(
        id: json['id'],
        amount: json['amount'],
        createdAt: DateTime.tryParse(json['created_at']),
        paymentMethodModel: json['payment_method'] == null
            ? null
            : PaymentMethodModel.fromJson(
                json['payment_method'],
              ),
        transactionType: json['transaction_type'] == null
            ? null
            : TransactionTypeModel.fromJson(
                json['transaction_type'],
              ),
      );
}
