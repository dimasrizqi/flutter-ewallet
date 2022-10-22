part of 'transacsion_bloc.dart';

abstract class TransacsionState extends Equatable {
  const TransacsionState();

  @override
  List<Object> get props => [];
}

class TransacsionInitial extends TransacsionState {}

class TransacsionLoading extends TransacsionState {}

class TransacsionFailed extends TransacsionState {
  final String e;
  const TransacsionFailed(this.e);
  @override
  List<Object> get props => [e];
}

class TransacsionSuccess extends TransacsionState {
  final List<TransacsionFromModel> transacsions;
  const TransacsionSuccess(this.transacsions);
  @override
  List<Object> get props => [transacsions];
}
