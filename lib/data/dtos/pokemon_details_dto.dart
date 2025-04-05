import 'package:im_mottu_mobile/data/dtos/pokemon_ability_dto.dart';
import 'package:im_mottu_mobile/data/dtos/pokemon_type_dto.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_details_dto.g.dart';

@JsonSerializable()
class PokemonDetailsDto extends PokemonDetailsEntity {
  @override
  final List<PokemonAbilityDto> abilities;

  @override
  final List<PokemonTypeDto> types;

  PokemonDetailsDto(
    name,
    height,
    weight,
    this.abilities,
    this.types,
  ) : super(name, height, weight, abilities, types);

  factory PokemonDetailsDto.fromJson(Map<String, dynamic> json) =>
      PokemonDetailsDto(
        json['name'],
        json['height'],
        json['weight'],
        (json['abilities'] as List<dynamic>)
            .map((e) => PokemonAbilityDto.fromJson(e["ability"] as Map<String, dynamic>))
            .toList(),
        (json['types'] as List<dynamic>)
            .map((e) => PokemonTypeDto.fromJson(e["type"] as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => _$PokemonDetailsDtoToJson(this);
}
