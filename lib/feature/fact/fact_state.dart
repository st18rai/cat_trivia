import 'package:cat_trivia/data/fact_model.dart';

abstract class FactState {}

class FactInitialState extends FactState {}

class FactErrorState extends FactState {
  final String message;

  FactErrorState({
    required this.message,
  });
}

class FactLoadingState extends FactState {}

class FactSuccessState extends FactState {
  final FactModel newFact;
  final String imageUrl;

  FactSuccessState({
    required this.newFact,
    required this.imageUrl,
  });
}
