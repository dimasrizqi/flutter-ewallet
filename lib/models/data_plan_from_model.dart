class DataPlanFormModel {
  final int? dataPlasnId;

  final String? phoneNumber;
  final String? pin;

  DataPlanFormModel({
    this.dataPlasnId,
    this.phoneNumber,
    this.pin,
  });

  Map<String, dynamic> toJson() {
    return {
      'data_plan_id': dataPlasnId.toString(),
      'phone_number': phoneNumber,
      'pin': pin,
    };
  }
}
