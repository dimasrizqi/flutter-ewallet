import 'dart:io';

import 'package:app_ecom_buidlagga/models/tip_model.dart';
import 'package:app_ecom_buidlagga/services/tip_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tip_event.dart';
part 'tip_state.dart';

class TipBloc extends Bloc<TipEvent, TipState> {
  TipBloc() : super(TipInitial()) {
    on<TipEvent>(
      (event, emit) async {
        if (event is TipGet) {
          try {
            emit(TipLoading());

            final tips = await TipSevice().getTips();

            emit(TipSuccess(tips));
          } catch (e) {
            emit(TipFailed(e.toString()));
          }
        }
      },
    );
  }
}
