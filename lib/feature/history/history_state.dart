import 'package:cat_trivia/data/fact_model.dart';

abstract class HistoryState {}

class HistoryInitialState extends HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistoryErrorState extends HistoryState {}

class HistoryLoadedState extends HistoryState {
  final List<FactModel> facts;

  HistoryLoadedState({
    required this.facts,
  });
}
