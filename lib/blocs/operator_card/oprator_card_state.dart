part of 'oprator_card_bloc.dart';

abstract class OpratorCardState extends Equatable {
  const OpratorCardState();

  @override
  List<Object> get props => [];
}

class OpratorCardInitial extends OpratorCardState {}

class OpratorCardLoading extends OpratorCardState {}

class OpratorCardFailed extends OpratorCardState {
  final String e;
  const OpratorCardFailed(this.e);

  @override
  List<Object> get props => [e];
}

class OpratorCardSuccess extends OpratorCardState {
  final List<OpratorCardModel> opratorCards;

  const OpratorCardSuccess(this.opratorCards);

  @override
  List<Object> get props => [opratorCards];
}
