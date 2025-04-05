import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:im_mottu_mobile/ui/widgets/common_card.dart';

class PokemonCard extends StatelessWidget {
  final PokemonEntity pokemon;
  final VoidCallback onTap;

  const PokemonCard({
    required this.pokemon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CommonCard(
        child: Column(
          children: [
            Expanded(child: Image.network(pokemon.image)),
            const SizedBox(height: 8),
            Text(
              pokemon.name.capitalize ?? '',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
