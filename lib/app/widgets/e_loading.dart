import 'package:flutter/material.dart';
import 'package:movies_app/app/theme/colors.dart';

class ELoading extends StatelessWidget {
  final bool linear;

  const ELoading({super.key, this.linear = false});

  @override
  Widget build(BuildContext context) {
    if (linear) {
      return const LinearProgressIndicator(
        color: EColor.orange,
      );
    }
    return const Center(
      child: CircularProgressIndicator(
        color: EColor.orange,
      ),
    );
  }
}
