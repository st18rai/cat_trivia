import 'dart:async';

import 'package:cat_trivia/feature/history/history_event.dart';
import 'package:cat_trivia/feature/history/history_state.dart';
import 'package:cat_trivia/repository/fact_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final FactRepository repository;

  HistoryBloc(this.repository) : super(HistoryInitialState()) {
    on<HistoryLoadEvent>(_onLoadHistory);
  }

  Future<FutureOr<void>> _onLoadHistory(
    HistoryLoadEvent event,
    Emitter<HistoryState> emit,
  ) async {
    emit(HistoryLoadingState());

    try {
      final facts = await repository.getSavedFacts();

      emit(
        HistoryLoadedState(facts: facts),
      );
    } catch (e) {
      final logger = Logger();
      logger.e(
        e.toString(),
      );
      emit(
        HistoryErrorState(),
      );
    }
  }
}
