// ignore: file_names
import 'package:app_ecom_buidlagga/shared/theme.dart';
import 'package:app_ecom_buidlagga/ui/widgets/tranfer_recent_users.dart';
import 'package:app_ecom_buidlagga/ui/widgets/tranfer_result_user.dart.dart';
import 'package:flutter/material.dart';

import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class TranferPage extends StatelessWidget {
  const TranferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tranfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          // ignore: prefer_const_constructors
          SizedBox(
            height: 40,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: 'by username',
            isShowTitle: false,
          ),
          // buildRecenUsers()
          buildResuitl(),
          const SizedBox(
            height: 250,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/tranfer-amount');
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget buildRecenUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Users",
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 14,
          ),
          const TranferRecentUsers(
            userName: 'yoenna',
            name: 'Yonna Jie',
            isVerified: true,
            imgUrl: 'assets/img_friend1.png',
          ),
          const TranferRecentUsers(
            userName: 'jhi',
            name: 'John Hi',
            isVerified: false,
            imgUrl: 'assets/img_friend2.png',
          ),
          const TranferRecentUsers(
            userName: 'form',
            name: 'Masayoshi',
            isVerified: false,
            imgUrl: 'assets/img_friend3.png',
          ),
        ],
      ),
    );
  }

  Widget buildResuitl() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: const [
              ResultUsers(
                userName: 'yoenna',
                name: 'Yonna Jie',
                isVerified: true,
                imgUrl: 'assets/img_friend1.png',
              ),
              ResultUsers(
                userName: 'yoenna',
                name: 'Yonna Jie',
                isVerified: false,
                imgUrl: 'assets/img_friend2.png',
                isSelected: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
