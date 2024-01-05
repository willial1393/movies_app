import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/app/screens/movie_list_screen/movie_list_provider.dart';
import 'package:movies_app/app/widgets/e_list_view.dart';
import 'package:movies_app/app/widgets/e_loading.dart';
import 'package:movies_app/app/widgets/e_retry.dart';
import 'package:movies_app/app/widgets/e_scaffold.dart';

@RoutePage()
class MovieListScreen extends ConsumerStatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends ConsumerState<MovieListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(
        ref.read(movieListProvider.notifier).getMovies(refresh: true),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final movieList = ref.watch(movieListProvider);
    return EScaffold(
      title: 'Películas',
      body: Column(
        children: [
          if (movieList.error)
            Expanded(
              child: ERetry(
                onRetry: () => unawaited(
                  fetchData(true),
                ),
              ),
            ),
          if (movieList.selectedMovies.isEmpty && !movieList.error)
            const Expanded(child: ELoading()),
          if (movieList.selectedMovies.isNotEmpty && !movieList.error)
            Expanded(
              child: EListView(
                onLoadMore: () async => fetchData(false),
                onRefresh: () async => fetchData(true),
                itemCount: movieList.selectedMovies.length,
                itemBuilder: (context, index) {
                  return Text(movieList.selectedMovies[index].title);
                },
              ),
            ),
        ],
      ),
    );
  }

  Future<void> fetchData(bool refresh) async {
    await ref.read(movieListProvider.notifier).getMovies(refresh: refresh);
  }
}
