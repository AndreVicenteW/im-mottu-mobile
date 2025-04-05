// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailsDto _$PokemonDetailsDtoFromJson(Map<String, dynamic> json) =>
    PokemonDetailsDto(
      json['name'],
      json['height'],
      json['weight'],
      (json['abilities'] as List<dynamic>)
          .map((e) => PokemonAbilityDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['types'] as List<dynamic>)
          .map((e) => PokemonTypeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonDetailsDtoToJson(PokemonDetailsDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'abilities': instance.abilities,
      'types': instance.types,
    };
