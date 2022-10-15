import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/theme.dart';

class HomeTransions extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String time;
  final String value;
  const HomeTransions(
      {super.key,
      required this.iconUrl,
      required this.title,
      required this.time,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Image.asset(
            iconUrl,
            width: 48,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  time,
                  style:
                      greyTextStyle.copyWith(fontWeight: regular, fontSize: 14),
                ),
              ],
            ),
          ),
          // ignore: prefer_const_constructors
          Text(
            value,
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
          )
        ],
      ),
    );
  }
}
