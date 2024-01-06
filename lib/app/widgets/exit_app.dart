import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/app/theme/colors.dart';

class ExitApp extends StatelessWidget {
  final Widget child;

  const ExitApp({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DoubleBackToCloseApp(
      snackBar: const SnackBar(
        backgroundColor: EColor.silver,
        content: Text(
          'Pulse dos veces para salir',
          textAlign: TextAlign.center,
        ),
      ),
      child: child,
    );
  }
}
