import 'package:app_ecom_buidlagga/shared/shared_methods.dart';
import 'package:app_ecom_buidlagga/shared/theme.dart';
import 'package:flutter/material.dart';

class DataPaket extends StatelessWidget {
  final int kouTa;
  final int hargaKouta;
  final bool isSelected;
  const DataPaket({
    super.key,
    required this.kouTa,
    required this.hargaKouta,
    this.isSelected = false,
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
            '${kouTa}GB',
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 32),
          ),
          Text(
            formatCurrency(hargaKouta),
            style: greyTextStyle.copyWith(fontWeight: regular, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
