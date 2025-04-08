import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/ui/pages/related_pokemon/related_pokemon_controller.dart';
import 'package:im_mottu_mobile/ui/widgets/pokemon_grid.dart';

class RelatedPokemonPage extends GetView<RelatedPokemonController> {
  const RelatedPokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: controller.obx(
                onLoading: const Center(child: CircularProgressIndicator()),
                onEmpty: const Text('No data found'),
                onError: (error) => Center(child: Text(error ?? '')),
                (state) => PokemonGrid(
                  list: state ?? [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
