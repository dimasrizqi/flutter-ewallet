import 'dart:io';

import 'package:app_ecom_buidlagga/blocs/auth/auth_bloc.dart';
import 'package:app_ecom_buidlagga/models/user_model.dart';
import 'package:app_ecom_buidlagga/services/user_sevice.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserGetByUsername) {
        try {
          emit(UserLoading());
          final users =
              await UserService().getRecentUsersByUserName(event.username);

          emit(UserSuccess(users));
        } catch (e) {
          emit(
            UserFailed(
              e.toString(),
            ),
          );
        }
      }
      if (event is UserGetRecent) {
        try {
          emit(UserLoading());
          final users = await UserService().getRecentUsers();

          emit(UserSuccess(users));
        } catch (e) {
          emit(
            UserFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
