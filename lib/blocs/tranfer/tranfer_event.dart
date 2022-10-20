part of 'tranfer_bloc.dart';

abstract class TranferEvent extends Equatable {
  const TranferEvent();

  @override
  List<Object> get props => [];
}

class TranferPost extends TranferEvent {
  final TransferFormModel data;

  const TranferPost(this.data);
  @override
  List<Object> get props => [data];
}
