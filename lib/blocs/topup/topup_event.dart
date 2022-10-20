part of 'topup_bloc.dart';

abstract class TopupEvent extends Equatable {
  const TopupEvent();

  @override
  List<Object> get props => [];
}

class TopUpPost extends TopupEvent {
  final TopFromModel data;

  const TopUpPost(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}
