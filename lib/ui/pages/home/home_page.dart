import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/core/helpers/debounce_helper.dart';
import 'package:im_mottu_mobile/core/routes/app_pages.dart';
import 'package:im_mottu_mobile/ui/pages/home/home_controller.dart';
import 'package:im_mottu_mobile/ui/pages/home/widgets/pokemon_card.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  final _searchController = TextEditingController();
  final _debounce = DebounceHelper(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextFormField(
          textInputAction: TextInputAction.search,
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search pokemon',
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              color: Colors.black,
              onPressed: () {
                _searchController.clear();
                controller.getPokemonList(search: '');
              },
            ),
          ),
          onChanged: (value) {
            _debounce.run(() {
              if (value.length > 2 || value.isEmpty) {
                controller.getPokemonList(search: value);
                FocusScope.of(context).requestFocus(FocusNode());
              }
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            controller.obx(
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
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.pokemonDetails,
                                arguments: pokemon.name,
                              );
                            },
                          ),
                        )
                        .toList() ??
                    [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
