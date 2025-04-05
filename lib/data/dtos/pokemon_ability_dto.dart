import 'package:im_mottu_mobile/domain/entities/pokemon_ability_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_ability_dto.g.dart';

@JsonSerializable()
class PokemonAbilityDto extends PokemonAbilityEntity {
  PokemonAbilityDto(super.name);

  factory PokemonAbilityDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityDtoFromJson(json);
}
