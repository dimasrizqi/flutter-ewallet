import 'package:app_ecom_buidlagga/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class HomeUser extends StatelessWidget {
  final UserModel user;
  const HomeUser({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 17),
      height: 120,
      width: 90,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 45,
            width: 45,
            margin: const EdgeInsets.only(
              top: 18,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: user.profilePicture == null
                      ? const AssetImage(
                          'assets/img_profile.png',
                        )
                      : NetworkImage(user.profilePicture!) as ImageProvider,
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            '@${user.username}',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
