part of 'tranfer_bloc.dart';

abstract class TranferState extends Equatable {
  const TranferState();

  @override
  List<Object> get props => [];
}

class TranferInitial extends TranferState {}

class TranferLoading extends TranferState {}

class TranferFailed extends TranferState {
  final String e;
  const TranferFailed(this.e);

  @override
  List<Object> get props => [e];
}

class TranferSuccess extends TranferState {}
