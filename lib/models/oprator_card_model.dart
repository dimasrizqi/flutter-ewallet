import 'package:app_ecom_buidlagga/models/data_palan_model.dart';

class OpratorCardModel {
  final int? id;
  final String? name;
  final String? status;
  final String? thumbnail;
  final List<DataPlanModel>? dataPlans;

  OpratorCardModel({
    this.id,
    this.name,
    this.status,
    this.thumbnail,
    this.dataPlans,
  });

  factory OpratorCardModel.fromJson(Map<String, dynamic> json) =>
      OpratorCardModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        thumbnail: json['thumbnail'],
        dataPlans: json['data_plans'] == null
            ? null
            : (json['data_plans'] as List)
                .map((dataPlan) => DataPlanModel.fromJson(dataPlan))
                .toList(),
      );
}
