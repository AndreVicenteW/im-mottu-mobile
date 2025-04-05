import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/ui/pages/pokemon_details/pokemon_details_controller.dart';
import 'package:im_mottu_mobile/ui/widgets/common_card.dart';

class PokemonDetailsPage extends GetView<PokemonDetailsController> {
  const PokemonDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: controller.obx(
          onLoading: const Center(child: CircularProgressIndicator()),
          onEmpty: const Text('No data found'),
          onError: (error) => const Center(child: Text('Error, no data found')),
          (pokemon) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (pokemon != null) ...[
                CommonCard(
                  child: Image.network(pokemon.image),
                ),
                const SizedBox(height: 8),
                CommonCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Name: ${pokemon.name.capitalize ?? ''}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Height: ${pokemon.heightToCM}cm',
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Weight: ${pokemon.weightToKG}kg',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
