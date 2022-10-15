import 'package:app_ecom_buidlagga/shared/theme.dart';
import 'package:flutter/material.dart';

class TranferRecentUsers extends StatelessWidget {
  final String userName;
  final String name;
  final bool isVerified;
  final String imgUrl;

  const TranferRecentUsers(
      {super.key,
      required this.userName,
      required this.name,
      this.isVerified = false,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 22),
      margin: const EdgeInsets.only(bottom: 18),
      height: 89,
      width: 327,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            margin: const EdgeInsets.only(right: 14),
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  imgUrl,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                "@$userName",
                style: greyTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          if (isVerified)
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 14,
                  color: greenColor,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Verified',
                  style: greenTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 11,
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}
