import 'package:flutter/material.dart';

class ERetry extends StatelessWidget {
  final VoidCallback onRetry;

  const ERetry({required this.onRetry, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onRetry,
        child: const Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Reintentar'),
                Icon(Icons.refresh),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
