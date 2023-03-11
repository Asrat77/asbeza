import 'dart:async';

import 'package:asbeza/bloc/home_event.dart';
import 'package:asbeza/bloc/home_state.dart';
import 'package:asbeza/models/asbeza.dart';
import 'package:bloc/bloc.dart';
import '../data_provider/apiService.dart';



class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _apiServiceProvider = ApiService();

  HomeBloc() : super(HomeInitialState()) {
    on<GetDataButtonPressed>((event, emit) async {
      emit(HomeLoadingState());
      final asbeza = await _apiServiceProvider.fetchAsbeza();
      emit(HomeSuccessState(asbeza: asbeza));
  });
}
}
