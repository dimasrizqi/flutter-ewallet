import 'package:app_ecom_buidlagga/models/top_up_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/theme.dart';
import '../widgets/buttons.dart';

class TopUpAmount extends StatefulWidget {
  final TopFromModel data;

  const TopUpAmount({super.key, required this.data});

  @override
  State<TopUpAmount> createState() => _TopUpAmountState();
}

class _TopUpAmountState extends State<TopUpAmount> {
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
      body: ListView(
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
            title: 'Checkout Now',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin-page') == true) {
                await launch('https://demo.midtrans.com/');

                // ignore: use_build_context_synchronously
                Navigator.pushNamedAndRemoveUntil(
                    context, '/top-up-sukses', (route) => false);
              }
              ;
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
      ),
    );
  }
}
