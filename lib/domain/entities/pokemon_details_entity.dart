import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';

class PokemonDetailsEntity extends PokemonEntity {
  final int height;
  final int weight;

  PokemonDetailsEntity(
    super.name,
    this.height,
    this.weight,
  );

  int get heightToCM => height * 10;
  double get weightToKG => weight / 10;
}
