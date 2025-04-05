// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailsDto _$PokemonDetailsDtoFromJson(Map<String, dynamic> json) =>
    PokemonDetailsDto(
      json['name'] as String,
      (json['height'] as num).toInt(),
      (json['weight'] as num).toInt(),
    );

Map<String, dynamic> _$PokemonDetailsDtoToJson(PokemonDetailsDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
    };
