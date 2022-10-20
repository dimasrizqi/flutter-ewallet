import 'package:app_ecom_buidlagga/models/user_model.dart';
import 'package:app_ecom_buidlagga/shared/theme.dart';
import 'package:flutter/material.dart';

class ResultUsers extends StatelessWidget {
  final UserModel user;
  final bool isSelected;
  const ResultUsers({
    super.key,
    this.isSelected = false,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 150,
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
              image: DecorationImage(
                image: user.profilePicture == null
                    // ignore: prefer_const_constructors
                    ? AssetImage(
                        'assets/img_profile.png',
                      )
                    : NetworkImage(user.profilePicture!) as ImageProvider,
              ),
            ),
            child: user.verified == 1
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
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
            user.name.toString(),
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 2,
          ),
          Text(
            '@${user.username}',
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
