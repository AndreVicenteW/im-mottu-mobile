import 'package:flutter/material.dart';

class PokemonDetailsHorizontalList extends StatelessWidget {
  const PokemonDetailsHorizontalList({
    super.key,
    required this.title,
    required this.list,
    required this.itemBuilder,
  });

  final String title;
  final List list;
  final NullableIndexedWidgetBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 60,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}
