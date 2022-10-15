import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/theme.dart';

class MenuItemsProfil extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? onTap;
  const MenuItemsProfil(
      {super.key, required this.iconUrl, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 32),
        child: Row(
          children: [
            Image.asset(
              iconUrl,
              width: 24,
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
