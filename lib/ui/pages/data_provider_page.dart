import 'package:app_ecom_buidlagga/models/oprator_card_model.dart';
import 'package:app_ecom_buidlagga/shared/theme.dart';
import 'package:app_ecom_buidlagga/ui/pages/data_pakage_page.dart';
import 'package:app_ecom_buidlagga/ui/widgets/buttons.dart';
import 'package:app_ecom_buidlagga/ui/widgets/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/operator_card/oprator_card_bloc.dart';
import '../../shared/shared_methods.dart';

class DataProvider extends StatefulWidget {
  const DataProvider({super.key});

  @override
  State<DataProvider> createState() => _DataProviderState();
}

class _DataProviderState extends State<DataProvider> {
  OpratorCardModel? selectedOpratorCard;
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
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthSucces) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.cardNumber!.replaceAllMapped(
                              RegExp(r".{4}"), (match) => '${match.group(0)} '),
                          style: blackTextStyle.copyWith(
                              fontWeight: medium, fontSize: 16),
                        ),
                        Text(
                          'Balance: ${formatCurrency(state.user.balance ?? 0)}',
                          style: greyTextStyle.copyWith(
                              fontWeight: regular, fontSize: 12),
                        )
                      ],
                    );
                  }
                  return Container();
                },
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
          BlocProvider(
            create: (context) => OpratorCardBloc()..add(OpratorCardGet()),
            child: BlocBuilder<OpratorCardBloc, OpratorCardState>(
              builder: (context, state) {
                if (state is OpratorCardSuccess) {
                  return Column(
                      children: state.opratorCards.map((opratorCard) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOpratorCard = opratorCard;
                          });
                        },
                        child: CardProvider(
                          opratorCard: opratorCard,
                          isSelected: opratorCard.id == selectedOpratorCard?.id,
                        ));
                  }).toList());
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
      floatingActionButton: (selectedOpratorCard != null)
          ? Container(
              margin: const EdgeInsets.all(25),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataProviderPage(
                        operatorCard: selectedOpratorCard!,
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
