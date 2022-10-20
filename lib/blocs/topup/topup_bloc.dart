import 'dart:io';

import 'package:app_ecom_buidlagga/blocs/auth/auth_bloc.dart';
import 'package:app_ecom_buidlagga/models/top_up_model.dart';
import 'package:app_ecom_buidlagga/services/data_transacsion_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'topup_event.dart';
part 'topup_state.dart';

class TopupBloc extends Bloc<TopupEvent, TopupState> {
  TopupBloc() : super(TopupInitial()) {
    on<TopupEvent>((event, emit) async {
      if (event is TopUpPost) {
        try {
          emit(TopupLoading());

          final reditrectUrl = await TransaionService().topUp(event.data);

          emit(TopupSucces(reditrectUrl));
        } catch (e) {
          emit(TopupFailed(e.toString()));
        }
      }
    });
  }
}
