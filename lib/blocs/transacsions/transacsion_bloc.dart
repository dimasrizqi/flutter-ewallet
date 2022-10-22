import 'package:app_ecom_buidlagga/blocs/tranfer/tranfer_bloc.dart';
import 'package:app_ecom_buidlagga/models/transaction_model.dart';
import 'package:app_ecom_buidlagga/services/data_transacsion_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transacsion_event.dart';
part 'transacsion_state.dart';

class TransacsionBloc extends Bloc<TransacsionEvent, TransacsionState> {
  TransacsionBloc() : super(TransacsionInitial()) {
    on<TransacsionEvent>((event, emit) async {
      if (event is TransacsionGet) {
        try {
          emit(TransacsionLoading());

          final transacsions = await TransaionService().getTransacsionactioms();

          emit(TransacsionSuccess(transacsions));
        } catch (e) {
          emit(TransacsionFailed(e.toString()));
        }
      }
    });
  }
}
