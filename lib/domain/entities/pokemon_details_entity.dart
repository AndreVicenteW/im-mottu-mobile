import 'package:im_mottu_mobile/domain/entities/pokemon_ability_entity.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_type_entity.dart';

class PokemonDetailsEntity extends PokemonEntity {
  final int height;
  final int weight;
  final List<PokemonAbilityEntity> abilities;
  final List<PokemonTypeEntity> types;

  PokemonDetailsEntity(
    super.name,
    this.height,
    this.weight,
    this.abilities,
    this.types,
  );

  int get heightToCM => height * 10;

  double get weightToKG => weight / 10;
}
