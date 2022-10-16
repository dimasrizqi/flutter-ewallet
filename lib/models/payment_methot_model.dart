class PaymentMethodMode {
  final int? id;
  final String? name;
  final String? code;
  final String? thumbnail;

  PaymentMethodMode({
    this.id,
    this.name,
    this.code,
    this.thumbnail,
  });

  factory PaymentMethodMode.fromJson(Map<String, dynamic> json) =>
      PaymentMethodMode(
        id: json['id'],
        name: json['name'],
        code: json['code'],
        thumbnail: json['thumbnail'],
      );
}
