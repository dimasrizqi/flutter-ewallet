import 'package:app_ecom_buidlagga/blocs/tranfer/tranfer_bloc.dart';
import 'package:app_ecom_buidlagga/models/tranfer_from_model.dart';
import 'package:app_ecom_buidlagga/shared/shared_methods.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/topup/topup_bloc.dart';
import '../../shared/theme.dart';
import '../widgets/buttons.dart';

class TranferAmount extends StatefulWidget {
  final TransferFormModel data;
  const TranferAmount({super.key, required this.data});

  @override
  State<TranferAmount> createState() => _TranferAmountState();
}

class _TranferAmountState extends State<TranferAmount> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();

    amountController.addListener(() {
      final text = amountController.text;
      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(text.replaceAll('.', '')),
        ),
      );
    });
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deletedAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocProvider(
        create: (context) => TranferBloc(),
        child: BlocConsumer<TranferBloc, TranferState>(
          listener: (context, state) {
            if (state is TranferFailed) {
              showCustomSnackbar(context, state.e);
            }

            if (state is TranferSuccess) {
              context.read<AuthBloc>().add(
                    AuthUpdateBelance(int.parse(
                          amountController.text.replaceAll('.', ''),
                        ) *
                        -1),
                  );

              Navigator.pushNamedAndRemoveUntil(
                  context, '/tranfer-sukses', (route) => false);
            }
          },
          builder: (context, state) {
            if (state is TranferLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 58),
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 58,
                ),
                Center(
                  child: Text(
                    'Total Amount',
                    style: whiteTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 67,
                ),
                Align(
                  child: SizedBox(
                    width: 230,
                    child: TextFormField(
                      enabled: false,
                      controller: amountController,
                      cursorColor: greyColor,
                      style: whiteTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 36,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Text(
                          'Rp',
                          style: whiteTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 36,
                          ),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                        ),
                      ),
                    ),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 66,
                ),
                Wrap(
                  spacing: 35,
                  runSpacing: 35,
                  children: [
                    CustomInputButton(
                      title: '1',
                      onTap: () {
                        addAmount('1');
                      },
                    ),
                    CustomInputButton(
                      title: '2',
                      onTap: () {
                        addAmount('2');
                      },
                    ),
                    CustomInputButton(
                      title: '3',
                      onTap: () {
                        addAmount('3');
                      },
                    ),
                    CustomInputButton(
                      title: '4',
                      onTap: () {
                        addAmount('4');
                      },
                    ),
                    CustomInputButton(
                      title: '5',
                      onTap: () {
                        addAmount('5');
                      },
                    ),
                    CustomInputButton(
                      title: '6',
                      onTap: () {
                        addAmount('6');
                      },
                    ),
                    CustomInputButton(
                      title: '7',
                      onTap: () {
                        addAmount('7');
                      },
                    ),
                    CustomInputButton(
                      title: '8',
                      onTap: () {
                        addAmount('8');
                      },
                    ),
                    CustomInputButton(
                      title: '9',
                      onTap: () {
                        addAmount('9');
                      },
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 60,
                      height: 60,
                    ),
                    CustomInputButton(
                      title: '0',
                      onTap: () {
                        addAmount('0');
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        deletedAmount();
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: numberBackgroundColor,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 50,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () async {
                    if (await Navigator.pushNamed(context, '/pin-page') ==
                        true) {
                      final authState = context.read<AuthBloc>().state;

                      String pin = '';
                      if (authState is AuthSucces) {
                        pin = authState.user.pin!;
                      }

                      context.read<TranferBloc>().add(
                            TranferPost(
                              widget.data.copyWith(
                                pin: pin,
                                amount:
                                    amountController.text.replaceAll('.', ''),
                              ),
                            ),
                          );
                      // ignore: use_build_context_synchronously
                    }
                  },
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),
                CustomTextButton(
                  title: 'Terms & Conditions',
                  onPressed: () {},
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 40,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
