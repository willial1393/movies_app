import 'package:flutter/material.dart';

class EScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const EScaffold({
    required this.title,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(child: body),
    );
  }
}
