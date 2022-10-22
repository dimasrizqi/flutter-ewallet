import 'package:app_ecom_buidlagga/models/data_palan_model.dart';
import 'package:app_ecom_buidlagga/shared/shared_methods.dart';
import 'package:app_ecom_buidlagga/shared/theme.dart';
import 'package:flutter/material.dart';

class DataPaket extends StatelessWidget {
  final DataPlanModel dataPlan;
  final bool isSelected;
  const DataPaket({
    super.key,
    this.isSelected = false,
    required this.dataPlan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      width: 155,
      height: 175,
      decoration: BoxDecoration(
        color: whiteColor,
        border:
            Border.all(color: isSelected ? blueColor : whiteColor, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dataPlan.name.toString(),
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 32),
          ),
          Text(
            formatCurrency(dataPlan.price ?? 0),
            style: greyTextStyle.copyWith(fontWeight: regular, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
