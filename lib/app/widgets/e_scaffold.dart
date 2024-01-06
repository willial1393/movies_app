import 'package:flutter/material.dart';
import 'package:movies_app/app/theme/colors.dart';
import 'package:movies_app/app/widgets/e_menu.dart';

class EScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final VoidCallback? onBack;
  final VoidCallback? onFloatAction;
  final IconData? floatActionIcon;

  const EScaffold({
    required this.title,
    required this.body,
    this.onFloatAction,
    this.onBack,
    this.floatActionIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: EColor.orange,
      ),
      drawer: onBack != null ? null : const EMenu(),
      body: SafeArea(child: body),
      floatingActionButton: onFloatAction == null
          ? null
          : FloatingActionButton(
              onPressed: onFloatAction,
              shape: const CircleBorder(
                side: BorderSide(color: EColor.orange, width: 2),
              ),
              child: Icon(floatActionIcon ?? Icons.search),
            ),
    );
  }
}
