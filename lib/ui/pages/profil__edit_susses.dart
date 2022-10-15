import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/theme.dart';
import '../widgets/buttons.dart';

class EditProfileSukses extends StatelessWidget {
  const EditProfileSukses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nice Update!',
              textAlign: TextAlign.center,
              style:
                  blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 23,
            ),
            Text(
              'Your data is safe with\nour system',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: regular),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 50,
            ),
            CustomFilledButton(
              height: 50,
              width: 183,
              title: 'My Profile',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home-page', (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
