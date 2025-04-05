import 'package:im_mottu_mobile/domain/entities/pokemon_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_details_dto.g.dart';

@JsonSerializable()
class PokemonDetailsDto extends PokemonDetailsEntity {
  PokemonDetailsDto(super.name, super.height, super.weight);

  factory PokemonDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsDtoFromJson(json);
}
