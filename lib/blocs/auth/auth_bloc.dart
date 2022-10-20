import 'package:app_ecom_buidlagga/models/sign_in_from_model.dart';
import 'package:app_ecom_buidlagga/models/sign_up_from_model.dart';
import 'package:app_ecom_buidlagga/models/user_edit_from_model.dart';
import 'package:app_ecom_buidlagga/models/user_model.dart';
import 'package:app_ecom_buidlagga/services/auth_sevice.dart';
import 'package:app_ecom_buidlagga/services/user_sevice.dart';
import 'package:app_ecom_buidlagga/services/wallet_sevice.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());

          final res = await AuthSevices().checkEmail(event.email);
          if (res == false) {
            emit(AuthCheckEmailSucces());
          } else {
            emit(const AuthFailed('Email Sudah Terpakai'));
          }
        } catch (e) {
          emit(
            AuthFailed(
              e.toString(),
            ),
          );
        }
      }
      if (event is AuthRegister) {
        try {
          emit(AuthLoading());
          final user = await AuthSevices().register(event.data);

          emit(AuthSucces(user));
        } catch (e) {
          emit(
            AuthFailed(
              e.toString(),
            ),
          );
        }
      }

      if (event is AuthLogin) {
        try {
          emit(AuthLoading());
          final user = await AuthSevices().login(event.data);

          emit(AuthSucces(user));
        } catch (e) {
          emit(
            AuthFailed(
              e.toString(),
            ),
          );
        }
      }
      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());

          final SignInFromModel data =
              await AuthSevices().getCredenstsialFromLocal();

          final UserModel user = await AuthSevices().login(data);

          emit(AuthSucces(user));
        } catch (e) {
          emit(
            AuthFailed(
              e.toString(),
            ),
          );
        }
      }

      if (event is AuthUpdateUser) {
        try {
          if (state is AuthSucces) {
            final updateUser = (state as AuthSucces).user.copyWith(
                  username: event.data.username,
                  name: event.data.name,
                  email: event.data.email,
                  password: event.data.password,
                );
            emit(AuthLoading());

            await UserService().updateUser(event.data);

            emit(
              AuthSucces(updateUser),
            );
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuthUpdatePin) {
        try {
          if (state is AuthSucces) {
            final updateUser = (state as AuthSucces).user.copyWith(
                  pin: event.newPin,
                );
            emit(AuthLoading());

            await WalletServices().updatePin(
              event.oldPin,
              event.newPin,
            );

            emit(
              AuthSucces(updateUser),
            );
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogout) {
        try {
          emit(AuthLoading());
          await AuthSevices().logoutt();
          emit(AuthInitial());
        } catch (e) {
          emit(
            AuthFailed(
              e.toString(),
            ),
          );
        }
      }

      if (event is AuthUpdateBelance) {
        if (state is AuthSucces) {
          final cureentUser = (state as AuthSucces).user;
          final updateUser = cureentUser.copyWith(
            balance: cureentUser.balance! + event.amount,
          );

          emit(
            AuthSucces(updateUser),
          );
        }
      }
    });
  }
}
