part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchEvent extends HomeEvent {
  const FetchEvent();
  @override
  List<Object> get props => [];
}

class HistoryEvent extends HomeEvent {
  final Asbeza asbeza;
  HistoryEvent({required this.asbeza});

  @override
  List<Object> get props => [];

  get data => asbeza;
}
class RemoveItemEvent extends HomeEvent{
  final int index;
  RemoveItemEvent(
      this.index
      );
  @override
  List<Object> get props => [];
   get data => index;
}
