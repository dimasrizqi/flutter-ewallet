import 'package:app_ecom_buidlagga/shared/theme.dart';
import 'package:app_ecom_buidlagga/ui/widgets/buttons.dart';
import 'package:app_ecom_buidlagga/ui/widgets/card_provider.dart';
import 'package:flutter/material.dart';

import '../../shared/shared_methods.dart';

class DataProvider extends StatelessWidget {
  const DataProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          // ignore: prefer_const_constructors
          SizedBox(
            height: 40,
          ),
          Text(
            'From Wallet',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 10,
          ),
          Row(
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
                    'Balance: ${formatCurrency(180000000)}',
                    style: greyTextStyle.copyWith(
                        fontWeight: regular, fontSize: 12),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          const CardProvider(
            title: 'Telkomsel',
            imgUrl: 'assets/img_provider_telkomsel.png',
            isSelected: true,
          ),
          const CardProvider(
              title: 'INDOSAT', imgUrl: 'assets/img_provider_indosat.png'),
          const CardProvider(
              title: 'Singtel ID', imgUrl: 'assets/img_provider_singtel.png'),

          const SizedBox(
            height: 30,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/data-pakage');
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
