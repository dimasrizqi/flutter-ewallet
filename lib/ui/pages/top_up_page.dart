import 'package:app_ecom_buidlagga/models/payment_methot_model.dart';
import 'package:app_ecom_buidlagga/shared/theme.dart';
import 'package:app_ecom_buidlagga/ui/pages/top_up_amout.dart';
import 'package:app_ecom_buidlagga/ui/widgets/buttons.dart';
import 'package:app_ecom_buidlagga/ui/widgets/card_bank.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/paymen_methods/payment_method_bloc.dart';
import '../../models/top_up_model.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({
    super.key,
  });

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  PaymentMethodModel? selectedpaymentMethod;
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
                          state.user.cardNumber!.replaceFirstMapped(
                              RegExp(r".{4}"), (match) => '${match.group(0)} '),
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
          BlocProvider(
            create: (context) => PaymentMethodBloc()..add(PaymentMethotGet()),
            child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
              builder: (context, state) {
                if (state is PaymentMethodSuccess) {
                  return Column(
                      children: state.paymentMenthost.map((paymentMethod) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedpaymentMethod = paymentMethod;
                        });
                      },
                      child: CardBank(
                        paymentMethod: paymentMethod,
                        isSelected:
                            paymentMethod.id == selectedpaymentMethod?.id,
                      ),
                    );
                  }).toList());
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          const SizedBox(
            height: 150,
          ),
        ],
      ),
      floatingActionButton: (selectedpaymentMethod != null)
          ? Container(
              margin: const EdgeInsets.all(25),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopUpAmount(
                        data: TopFromModel(
                            paymentMethodCode: selectedpaymentMethod?.code),
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
