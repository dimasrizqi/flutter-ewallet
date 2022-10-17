class TopFromModel {
  final String? amount;
  final String? pin;
  final String? paymentMethodCode;

  TopFromModel({
    this.amount,
    this.pin,
    this.paymentMethodCode,
  });

  TopFromModel copyWith({
    String? amount,
    String? pin,
    String? paymentMethodCode,
  }) =>
      TopFromModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "pin": pin,
        "payment_method_code": paymentMethodCode,
      };
}
