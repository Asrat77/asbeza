import 'package:asbeza/models/asbeza.dart';
import 'package:equatable/equatable.dart';

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
  List? asbeza;

  HomeSuccessState({
      required this.asbeza,}
      );

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
