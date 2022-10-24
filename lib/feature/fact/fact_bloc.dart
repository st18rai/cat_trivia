import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cat_trivia/constants/constants.dart';
import 'package:cat_trivia/repository/fact_repository.dart';
import 'package:cat_trivia/feature/fact/fact_event.dart';
import 'package:cat_trivia/feature/fact/fact_state.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class FactBloc extends Bloc<FactEvent, FactState> {
  final FactRepository repository;

  FactBloc(this.repository) : super(FactInitialState()) {
    on<FactEvent>(_onLoadFact);
  }

  Future<FutureOr<void>> _onLoadFact(
    FactEvent event,
    Emitter<FactState> emit,
  ) async {
    emit(FactLoadingState());

    try {
      final fact = await repository.fetchFact();

      await repository.saveFact(fact);

      final imageUrl =
          '$randomCatImageUrl?${_generateRandomInt()}'; // for load new image on new state

      emit(
        FactSuccessState(
          newFact: fact,
          imageUrl: imageUrl,
        ),
      );
    } catch (e) {
      final logger = Logger();
      logger.e(
        e.toString(),
      );
      emit(
        FactErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  int _generateRandomInt() {
    Random random = Random();
    int randomNumber = random.nextInt(1000);
    return randomNumber;
  }
}
