// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FactModelAdapter extends TypeAdapter<FactModel> {
  @override
  final int typeId = 1;

  @override
  FactModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FactModel(
      fact: fields[0] as String,
      length: fields[1] as int,
      createdAt: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FactModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.fact)
      ..writeByte(1)
      ..write(obj.length)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FactModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FactsAdapter extends TypeAdapter<Facts> {
  @override
  final int typeId = 2;

  @override
  Facts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Facts(
      (fields[0] as List).cast<FactModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, Facts obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.facts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FactsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactModel _$FactModelFromJson(Map<String, dynamic> json) => FactModel(
      fact: json['fact'] as String,
      length: json['length'] as int,
      createdAt: DateTime.now(),
    );

Map<String, dynamic> _$FactModelToJson(FactModel instance) => <String, dynamic>{
      'fact': instance.fact,
      'length': instance.length,
      'createdAt': instance.createdAt.toIso8601String(),
    };
