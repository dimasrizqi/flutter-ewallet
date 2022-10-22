import 'package:app_ecom_buidlagga/models/transaction_model.dart';
import 'package:app_ecom_buidlagga/shared/shared_methods.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../shared/theme.dart';

class HomeTransions extends StatelessWidget {
  final TransacsionFromModel transacsions;
  final String? imgUrl;
  const HomeTransions({
    super.key,
    required this.transacsions,
    this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transacsions.transactionType!.name.toString(),
                  style:
                      blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  DateFormat('MMM dd').format(
                    transacsions.createdAt ?? DateTime.now(),
                  ),
                  style:
                      greyTextStyle.copyWith(fontWeight: regular, fontSize: 14),
                ),
              ],
            ),
          ),
          // ignore: prefer_const_constructors
          Text(
            formatCurrency(
              transacsions.amount ?? 0,
              symbol:
                  transacsions.transactionType?.action == 'cr' ? '+ ' : '- ',
            ),
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
          )
        ],
      ),
    );
  }
}
