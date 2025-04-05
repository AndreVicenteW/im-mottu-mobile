import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final Widget child;

  const CommonCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 2,
            color: Colors.black12,
          ),
        ],
      ),
      child: child,
    );
  }
}
