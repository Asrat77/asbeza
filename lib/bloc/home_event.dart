import 'package:equatable/equatable.dart';

import '../models/asbeza.dart';

abstract class HomeEvent extends Equatable {}

class GetDataButtonPressed extends HomeEvent {

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