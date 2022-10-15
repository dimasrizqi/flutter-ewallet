import 'package:app_ecom_buidlagga/ui/widgets/data_paket.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class DataProviderPage extends StatelessWidget {
  const DataProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paket Data',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          // ignore: prefer_const_constructors
          SizedBox(
            height: 40,
          ),
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: '+628',
            isShowTitle: false,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Selected Paket',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: const [
              DataPaket(kouTa: 10, hargaKouta: 10000),
              DataPaket(kouTa: 30, hargaKouta: 20000),
              DataPaket(
                kouTa: 120,
                hargaKouta: 30000,
                isSelected: true,
              ),
              DataPaket(kouTa: 200, hargaKouta: 1000000),
            ],
          ),

          const SizedBox(
            height: 85,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin-page') == true) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/data-sukses', (route) => false);
              }
              ;
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
