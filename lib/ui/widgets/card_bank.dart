import 'package:flutter/cupertino.dart';

import '../../shared/theme.dart';

class CardBank extends StatelessWidget {
  final String title;
  final String imgUrl;
  final bool isSelected;
  const CardBank({
    super.key,
    required this.title,
    required this.imgUrl,
    this.isSelected = false,
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
          Image.asset(
            imgUrl,
            width: 96,
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
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
