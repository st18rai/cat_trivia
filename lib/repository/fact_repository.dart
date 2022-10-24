import 'package:cat_trivia/constants/constants.dart';
import 'package:cat_trivia/data/fact_model.dart';
import 'package:cat_trivia/network/api_client.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class FactRepository {
  final ApiClient _client;

  FactRepository({required ApiClient client}) : _client = client;

  Future<FactModel> fetchFact() async {
    return await _client.getFact().then((value) => value).catchError((e) {
      final logger = Logger();
      logger.e('Fetch fact error: $e');
    });
  }

  Future<void> saveFact(FactModel fact) async {
    final box = await Hive.openBox(hiveBoxKey);

    Facts factsWrapper = Facts(<FactModel>[]);

    final oldFacts = await box.get(hiveFactsKey);

    if (oldFacts != null) {
      oldFacts.facts.add(fact);
      box.put(hiveFactsKey, oldFacts);
    } else {
      factsWrapper.facts.add(fact);
      box.put(hiveFactsKey, factsWrapper);
    }
  }

  Future<List<FactModel>> getSavedFacts() async {
    final box = await Hive.openBox(hiveBoxKey);

    final Facts factsWrapper = await box.get(hiveFactsKey);

    return factsWrapper.facts;
  }
}
