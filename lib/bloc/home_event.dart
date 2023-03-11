import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class GetDataButtonPressed extends HomeEvent {

  @override
  List<Object> get props => [];
}