part of 'oprator_card_bloc.dart';

abstract class OpratorCardEvent extends Equatable {
  const OpratorCardEvent();

  @override
  List<Object> get props => [];
}

class OpratorCardGet extends OpratorCardEvent {}
