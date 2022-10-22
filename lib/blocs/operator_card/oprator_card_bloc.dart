import 'package:app_ecom_buidlagga/models/oprator_card_model.dart';
import 'package:app_ecom_buidlagga/services/oprator_card_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'oprator_card_event.dart';
part 'oprator_card_state.dart';

class OpratorCardBloc extends Bloc<OpratorCardEvent, OpratorCardState> {
  OpratorCardBloc() : super(OpratorCardInitial()) {
    on<OpratorCardEvent>(
      (event, emit) async {
        if (event is OpratorCardGet) {
          try {
            emit(OpratorCardLoading());
            final opratorCards = await OpratorCardService().getOpratorCards();

            emit(OpratorCardSuccess(opratorCards));
          } catch (e) {
            emit(OpratorCardFailed(e.toString()));
          }
        }
      },
    );
  }
}
