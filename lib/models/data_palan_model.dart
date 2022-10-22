class DataPlanModel {
  final int? id;
  final String? name;
  final int? price;
  final int? opratorCardId;

  DataPlanModel({this.id, this.name, this.price, this.opratorCardId});

  factory DataPlanModel.fromJson(Map<String, dynamic> json) => DataPlanModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        opratorCardId: json['operator_card_id'],
      );
}
