import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_dto.g.dart';

@JsonSerializable()
class PokemonDto extends PokemonEntity {

  @override
  final String name;

  PokemonDto(
    this.name,
  ) : super(name);

  factory PokemonDto.fromJson(Map<String, dynamic> json) => _$PokemonDtoFromJson(json);
}
