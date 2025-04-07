import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const CommonCard({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
