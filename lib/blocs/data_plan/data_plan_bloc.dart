import 'dart:io';

import 'package:app_ecom_buidlagga/models/data_plan_from_model.dart';
import 'package:app_ecom_buidlagga/services/data_transacsion_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_plan_event.dart';
part 'data_plan_state.dart';

class DataPlanBloc extends Bloc<DataPlanEvent, DataPlanState> {
  DataPlanBloc() : super(DataPlanInitial()) {
    on<DataPlanEvent>((event, emit) async {
      if (event is DataPlanPost) {
        try {
          emit(DataPlanLoading());

          await TransaionService().dataPlan(event.data);

          emit(DataPlanSuccess());
        } catch (e) {
          emit(
            DataPlanFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
