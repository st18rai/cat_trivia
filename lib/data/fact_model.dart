import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fact_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class FactModel extends HiveObject {
  @HiveField(0)
  final String fact;
  @HiveField(1)
  final int length;
  @HiveField(2)
  final DateTime createdAt;

  FactModel({
    required this.fact,
    required this.length,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => _$FactModelToJson(this);

  factory FactModel.fromJson(Map<String, dynamic> json) =>
      _$FactModelFromJson(json);
}

@HiveType(typeId: 2)
class Facts extends HiveObject {
  @HiveField(0)
  final List<FactModel> facts;

  Facts(this.facts);
}
