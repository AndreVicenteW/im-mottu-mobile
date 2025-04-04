class PokemonEntity {
  final String name;

  PokemonEntity(
    this.name,
  );

  String get image =>
    'https://img.pokemondb.net/artwork/$name.jpg';

}
