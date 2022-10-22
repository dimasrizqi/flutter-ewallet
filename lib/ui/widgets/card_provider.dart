import 'package:app_ecom_buidlagga/models/oprator_card_model.dart';
import 'package:flutter/cupertino.dart';

import '../../shared/theme.dart';

class CardProvider extends StatelessWidget {
  final OpratorCardModel opratorCard;
  final bool isSelected;
  const CardProvider({
    super.key,
    this.isSelected = false,
    required this.opratorCard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
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
          Image.network(
            opratorCard.thumbnail.toString(),
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                opratorCard.name.toString(),
                style:
                    blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                opratorCard.status.toString(),
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
