import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../shared/shared_methods.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class ProfilEditPin extends StatefulWidget {
  const ProfilEditPin({super.key});

  @override
  State<ProfilEditPin> createState() => _ProfilEditPinState();
}

class _ProfilEditPinState extends State<ProfilEditPin> {
  get whiteColor => null;

  @override
  Widget build(BuildContext context) {
    final oldPinController = TextEditingController(text: '');
    final newPinController = TextEditingController(text: '');
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          showCustomSnackbar(context, state.e);
        }
        if (state is AuthSucces) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/edit-profil-sukses', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          // ignore: prefer_const_constructors
          return Center(
            child: const CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            // ignore: prefer_const_constructors
            title: Text(
              'EDIT PIN',
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.all(22),
                width: 327,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Column(
                  children: [
                    CustomFormField(
                      title: 'Old Pin',
                      controller: oldPinController,
                      obscureText: true,
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      title: 'New Pin',
                      controller: newPinController,
                      obscureText: true,
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: 'Update Now',
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthUpdatePin(
                                oldPinController.text,
                                newPinController.text,
                              ),
                            );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
