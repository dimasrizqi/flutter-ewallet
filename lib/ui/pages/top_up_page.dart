import 'package:app_ecom_buidlagga/shared/theme.dart';
import 'package:app_ecom_buidlagga/ui/widgets/buttons.dart';
import 'package:app_ecom_buidlagga/ui/widgets/card_bank.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top UP'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          // ignore: prefer_const_constructors
          SizedBox(
            height: 40,
          ),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 10,
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSucces) {
                return Row(
                  children: [
                    Image.asset(
                      'assets/img_wallet.png',
                      width: 80,
                      height: 55,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '8008 2208 1996',
                          style: blackTextStyle.copyWith(
                              fontWeight: medium, fontSize: 16),
                        ),
                        Text(
                          state.user.name.toString(),
                          style: greyTextStyle.copyWith(
                              fontWeight: regular, fontSize: 12),
                        )
                      ],
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          const CardBank(
            title: 'BANK BCA',
            imgUrl: 'assets/img_bank_bca.png',
            isSelected: true,
          ),
          const CardBank(title: 'BANK BNI', imgUrl: 'assets/img_bank_bni.png'),
          const CardBank(
              title: 'BANK MANDIRI', imgUrl: 'assets/img_bank_mandiri.png'),
          const CardBank(
              title: 'BANK OCBC', imgUrl: 'assets/img_bank_ocbc.png'),
          const SizedBox(
            height: 30,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/top-up-amount');
            },
          ),
          const SizedBox(
            height: 57,
          )
        ],
      ),
    );
  }
}
