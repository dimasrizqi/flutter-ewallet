import 'package:app_ecom_buidlagga/shared/theme.dart';
import 'package:flutter/material.dart';

class ResultUsers extends StatelessWidget {
  final String userName;
  final String name;
  final bool isVerified;
  final String imgUrl;
  final bool isSelected;
  const ResultUsers({
    super.key,
    required this.userName,
    required this.name,
    this.isVerified = false,
    required this.imgUrl,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 155,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        border:
            Border.all(color: isSelected ? blueColor : whiteColor, width: 2),
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(imgUrl))),
            child: isVerified
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: whiteColor),
                      child: Icon(
                        Icons.check_circle,
                        size: 14,
                        color: greenColor,
                      ),
                    ),
                  )
                : null,
          ),
          Text(
            name,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 2,
          ),
          Text(
            '@$userName',
            style: greyTextStyle.copyWith(
              fontWeight: regular,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
