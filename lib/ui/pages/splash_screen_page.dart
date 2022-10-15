import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../shared/theme.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSucces) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/home-page', (route) => false);
        }
        if (state is AuthFailed) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/onboarding', (route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: darkBackgroundColor,
            body: Center(
              child: Container(
                width: 155,
                height: 50,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/img_logo_dark.png',
                  ),
                )),
              ),
            ));
      },
    );
  }
}
