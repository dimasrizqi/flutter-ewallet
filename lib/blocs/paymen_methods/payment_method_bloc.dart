import 'package:app_ecom_buidlagga/models/payment_methot_model.dart';
import 'package:app_ecom_buidlagga/services/payment_methot.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_method_event.dart';
part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodInitial()) {
    on<PaymentMethodEvent>((event, emit) async {
      if (event is PaymentMethotGet) {
        try {
          emit(PaymentMethodLoading());
          final paymentMethods =
              await PaymenMethodSevice().getPaymenteMethods();

          emit(PaymentMethodSuccess(paymentMethods));
        } catch (e) {
          emit(PaymentMethodFailed(e.toString()));
        }
      }
    });
  }
}
