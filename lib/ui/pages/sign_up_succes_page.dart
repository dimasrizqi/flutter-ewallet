import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/theme.dart';
import '../widgets/buttons.dart';

class SignUpSucces extends StatefulWidget {
  const SignUpSucces({super.key});

  @override
  State<SignUpSucces> createState() => _SignUpSuccesState();
}

class _SignUpSuccesState extends State<SignUpSucces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Akun Berhasil\nTerdaftar',
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(fontSize: 20, fontWeight: medium),
            ),
            const SizedBox(
              height: 23,
            ),
            Text(
              'Grow your finance start\ntogether with us',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: regular),
            ),
            SizedBox(
              height: 50,
            ),
            CustomFilledButton(
              height: 50,
              width: 183,
              title: 'Get Started',
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
