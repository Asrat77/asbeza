part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeSuccessState extends HomeState {
  List asbeza;
  List history;

  HomeSuccessState({required this.asbeza, required this.history});

  @override
  // TODO: implement props
  List<Object> get props => [];
}



class HomeFailState extends HomeState {
  String message;

  HomeFailState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
