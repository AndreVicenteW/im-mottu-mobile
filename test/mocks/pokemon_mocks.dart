import 'package:im_mottu_mobile/domain/entities/pokemon_details_entity.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';

var pokemonListMock = [
  PokemonEntity('test 1'),
  PokemonEntity('test 2'),
  PokemonEntity('test 3'),
  PokemonEntity('test 4'),
  PokemonEntity('test 5'),
];

var pokemonDetailsEntityMock = PokemonDetailsEntity(
  'Test',
  10,
  10,
  [],
  [],
);

const pokemonListJson = '''
{"count":1302,"next":"https://pokeapi.co/api/v2/pokemon/?offset=2&limit=2","previous":null,"results":[{"name":"bulbasaur","url":"https://pokeapi.co/api/v2/pokemon/1/"},{"name":"ivysaur","url":"https://pokeapi.co/api/v2/pokemon/2/"}]}
''';

const jsonError = '''
{
    "code": "Error"
}
''';

const pokemonDetailsJson = '''
{"height":3, "name":"ditto", "weight":40, "abilities":[{"ability":{"name":"static","url":"https://pokeapi.co/api/v2/ability/9/"},"is_hidden":false,"slot":1},{"ability":{"name":"lightning-rod","url":"https://pokeapi.co/api/v2/ability/31/"},"is_hidden":true,"slot":3}],"types":[{"slot":1,"type":{"name":"electric","url":"https://pokeapi.co/api/v2/type/13/"}}]}
''';
