import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/app/providers/app_provider.dart';
import 'package:movies_app/app/router/router.dart';
import 'package:movies_app/app/screens/movie_list/movie_list_provider.dart';
import 'package:movies_app/app/types/movie.dart';
import 'package:movies_app/app/widgets/e_list_view.dart';
import 'package:movies_app/app/widgets/e_loading.dart';
import 'package:movies_app/app/widgets/e_movie_card.dart';
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
      unawaited(fetchData(true));
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(appProvider.select((value) => value.language), (previous, next) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        unawaited(fetchData(true));
      });
    });
    ref.listen(movieListProvider.select((value) => value.selectedMovieType),
        (previous, next) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        unawaited(fetchData(true));
      });
    });
    final movieList = ref.watch(movieListProvider);
    return EScaffold(
      onFloatAction: () async {
        await appRouter.push(const MovieSearchRoute());
      },
      title: 'Películas',
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15.w),
            child: DropdownButton<MovieType>(
              isExpanded: true,
              value: movieList.selectedMovieType,
              onChanged: (MovieType? value) async {
                if (value != null) {
                  ref.read(movieListProvider.notifier).setMovieType(value);
                }
              },
              items: MovieType.values.map((MovieType value) {
                return DropdownMenuItem<MovieType>(
                  value: value,
                  child: Text(value.humanize),
                );
              }).toList(),
            ),
          ),
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
                  return EMovieCard(movie: movieList.selectedMovies[index]);
                },
              ),
            ),
        ],
      ),
    );
  }

  Future<void> fetchData(bool refresh) async {
    final language = ref.read(appProvider).language;
    await ref.read(movieListProvider.notifier).getMovies(
          refresh: refresh,
          language: language,
        );
  }
}
