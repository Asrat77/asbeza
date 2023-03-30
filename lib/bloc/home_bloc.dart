import 'dart:async';
import 'dart:convert';

import 'package:asbeza/models/asbeza.dart';
import 'package:bloc/bloc.dart';
import '../data_provider/apiService.dart';
import 'package:asbeza/repo/db_connect.dart';
import 'package:asbeza/repo/db_support.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:asbeza/repo/db_service.dart';
part 'home_event.dart';
part 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _apiServiceProvider = ApiService();
  final _service = Service();
  List history = [];
  List historyArr = [];

  HomeBloc() : super(HomeInitialState()) {
    on<FetchEvent>((event, emit) async {
      emit(HomeLoadingState());
      final activity = await _apiServiceProvider.fetchAsbeza();
      await _service.readItems().then((val) => {
        history=val,
      });
      historyArr=Asbeza.historyList(history);
      emit(HomeSuccessState(asbeza: activity!, history: historyArr));
});
  on<HistoryEvent>((event, emit) => {
      if (!historyArr.contains(event.data)){
        historyArr.add(event.data),
    _service.saveItems(event.data),
    }
    });
    on<RemoveItemEvent>((event, emit) => {
      _service.deleteItems(historyArr[event.data].id),
      historyArr.removeAt(event.data),
    });
  }
}


