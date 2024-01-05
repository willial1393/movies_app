import 'package:flutter/material.dart';
import 'package:movies_app/app/theme/colors.dart';

class ELoading extends StatelessWidget {
  const ELoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: EColor.orange,
      ),
    );
  }
}
