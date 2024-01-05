import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/app/widgets/e_scaffold.dart';

@RoutePage()
class MovieListScreen extends StatelessWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EScaffold(
      title: 'Películas',
      body: Container(),
    );
  }
}
