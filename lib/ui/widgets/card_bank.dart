import 'package:app_ecom_buidlagga/models/payment_methot_model.dart';
import 'package:flutter/cupertino.dart';

import '../../shared/theme.dart';

class CardBank extends StatelessWidget {
  final PaymentMethodModel paymentMethod;
  final bool isSelected;

  const CardBank({
    super.key,
    this.isSelected = false,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 28),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        border:
            Border.all(width: 2, color: isSelected ? blueColor : whiteColor),
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                paymentMethod.name.toString(),
                style:
                    blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '50 mins',
                style:
                    greyTextStyle.copyWith(fontWeight: regular, fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
