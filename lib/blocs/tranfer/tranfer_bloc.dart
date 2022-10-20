import 'package:app_ecom_buidlagga/models/tranfer_from_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../services/data_transacsion_service.dart';

part 'tranfer_event.dart';
part 'tranfer_state.dart';

class TranferBloc extends Bloc<TranferEvent, TranferState> {
  TranferBloc() : super(TranferInitial()) {
    on<TranferEvent>((event, emit) async {
      if (event is TranferPost) {
        emit(TranferLoading());

        await TransaionService().tranfer(event.data);

        emit(TranferSuccess());
        try {} catch (e) {
          emit(TranferFailed(e.toString()));
        }
      }
    });
  }
}
