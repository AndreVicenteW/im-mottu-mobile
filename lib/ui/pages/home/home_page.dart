import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/ui/pages/home/home_controller.dart';
import 'package:im_mottu_mobile/ui/pages/home/widgets/pokemon_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: controller.obx(
          onLoading: const Center(child: CircularProgressIndicator()),
          onEmpty: const Text('No data found'),
          onError: (error) => Center(child: Text(error ?? '')),
          (state) => GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: state
                    ?.map(
                      (pokemon) => PokemonCard(
                        pokemon: pokemon,
                        onTap: () {},
                      ),
                    )
                    .toList() ??
                [],
          ),
        ),
      ),
    );
  }
}
