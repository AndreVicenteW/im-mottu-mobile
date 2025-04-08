import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/core/routes/app_pages.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:im_mottu_mobile/ui/pages/home/widgets/pokemon_card.dart';

class PokemonGrid extends StatelessWidget {
  final List<PokemonEntity> list;
  final ScrollController? scrollController;

  const PokemonGrid({
    super.key,
    required this.list,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      controller: scrollController,
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: list
          .map(
            (pokemon) => PokemonCard(
              pokemon: pokemon,
              onTap: () {
                Get.toNamed(
                  AppRoutes.pokemonDetails,
                  arguments: pokemon.name,
                  preventDuplicates: true,
                );
              },
            ),
          )
          .toList(),
    );
  }
}
