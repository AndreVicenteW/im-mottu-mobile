import 'package:im_mottu_mobile/domain/entities/pokemon_type_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_type_dto.g.dart';

@JsonSerializable()
class PokemonTypeDto extends PokemonTypeEntity {
  PokemonTypeDto(super.name);

  factory PokemonTypeDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeDtoFromJson(json);
}
