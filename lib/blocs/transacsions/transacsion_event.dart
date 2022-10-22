part of 'transacsion_bloc.dart';

abstract class TransacsionEvent extends Equatable {
  const TransacsionEvent();

  @override
  List<Object> get props => [];
}

class TransacsionGet extends TransacsionEvent {}
