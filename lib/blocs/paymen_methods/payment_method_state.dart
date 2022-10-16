part of 'payment_method_bloc.dart';

abstract class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => [];
}

class PaymentMethodInitial extends PaymentMethodState {}

class PaymentMethodLoading extends PaymentMethodState {}

class PaymentMethodFailed extends PaymentMethodState {
  final String e;
  const PaymentMethodFailed(this.e);

  @override
  List<Object> get props => [e];
}

class PaymentMethodSuccess extends PaymentMethodState {
  final List<PaymentMethodMode> paymentMenthost;
  const PaymentMethodSuccess(this.paymentMenthost);

  @override
  List<Object> get props => [paymentMenthost];
}