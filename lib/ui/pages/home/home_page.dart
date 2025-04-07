import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/core/helpers/debounce_helper.dart';
import 'package:im_mottu_mobile/ui/pages/home/home_controller.dart';
import 'package:im_mottu_mobile/ui/widgets/pokemon_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<HomeController>();
  final _searchController = TextEditingController();
  final _debounce = DebounceHelper(milliseconds: 1000);
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        _searchController.text.isEmpty) {
      controller.getPokemonList(
        search: _searchController.text,
        pagination: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
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
            Expanded(
              child: controller.obx(
                onLoading: const Center(child: CircularProgressIndicator()),
                onEmpty: const Text('No data found'),
                onError: (error) => Center(child: Text(error ?? '')),
                (state) => PokemonGrid(
                  list: state ?? [],
                  scrollController: _scrollController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
