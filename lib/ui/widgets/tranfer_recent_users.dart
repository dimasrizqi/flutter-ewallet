import 'package:app_ecom_buidlagga/models/user_model.dart';
import 'package:app_ecom_buidlagga/shared/theme.dart';
import 'package:app_ecom_buidlagga/ui/pages/profile_edit_pin.dart';
import 'package:flutter/material.dart';

class TranferRecentUsers extends StatelessWidget {
  final UserModel users;
  const TranferRecentUsers({
    super.key,
    required this.users,
  });

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
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // ignore: prefer_const_constructors
              image: DecorationImage(
                image: users.profilePicture == null
                    // ignore: prefer_const_constructors
                    ? AssetImage(
                        'assets/img_profile.png',
                      )
                    : NetworkImage(users.profilePicture!) as ImageProvider,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                users.name.toString(),
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
                "@${users.username}",
                style: greyTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          if (users.verified == 1)
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
