import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/app/providers/app_provider.dart';
import 'package:movies_app/app/screens/movie_list/movie_list_provider.dart';
import 'package:movies_app/app/theme/colors.dart';
import 'package:movies_app/app/types/date.dart';
import 'package:movies_app/app/widgets/e_list_view.dart';
import 'package:movies_app/app/widgets/e_loading.dart';
import 'package:movies_app/app/widgets/e_picture.dart';
import 'package:movies_app/app/widgets/e_retry.dart';
import 'package:movies_app/app/widgets/e_scaffold.dart';
import 'package:movies_app/environment.dart';

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
                  final movie = movieList.selectedMovies[index];
                  final path = '${env.pathImage}/${movie.posterPath}';
                  return Container(
                    height: 0.4.sw,
                    margin: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: EColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: EColor.silver.withOpacity(0.2),
                          blurRadius: 3,
                          offset: const Offset(3, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                            bottomLeft: Radius.circular(8.r),
                          ),
                          child: EPicture(
                            path: path,
                            height: 0.4.sw,
                            width: 0.26.sw,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                movie.releaseDate.toDateFormat(),
                                style: const TextStyle(color: EColor.grey),
                              ),
                              Text(
                                movie.overview,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                movie.genreIds.join(', '),
                                style: const TextStyle(color: EColor.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
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
