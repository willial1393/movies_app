import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/app/providers/app_provider.dart';
import 'package:movies_app/app/router/router.dart';
import 'package:movies_app/app/widgets/e_list_view.dart';
import 'package:movies_app/app/widgets/e_loading.dart';
import 'package:movies_app/app/widgets/e_movie_card.dart';
import 'package:movies_app/app/widgets/e_retry.dart';
import 'package:movies_app/app/widgets/e_scaffold.dart';
import 'package:movies_app/core/interfaces/movie_interface.dart';
import 'package:movies_app/core/models/movie_list/movie_list.dart';
import 'package:movies_app/injection.dart';

@RoutePage()
class MovieSearchScreen extends ConsumerStatefulWidget {
  const MovieSearchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends ConsumerState<MovieSearchScreen> {
  final _controller = TextEditingController();
  final MovieInterface _movieService = getIt<MovieInterface>();
  List<MovieList> movieList = [];
  bool error = false;
  bool loading = false;
  int page = 0;
  Timer? timer;
  String query = '';

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EScaffold(
      onBack: () {
        appRouter.back();
      },
      title: 'Buscar',
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              onChanged: search,
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Buscar',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            if (error)
              Expanded(
                child: ERetry(
                  onRetry: () async => fetchData(
                    refresh: true,
                    showLoading: true,
                  ),
                ),
              ),
            if (loading) const Expanded(child: ELoading()),
            if (!loading && !error && movieList.isEmpty && query.length > 2)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.search),
                      SizedBox(height: 10.h),
                      const Text('No se encontraron resultados'),
                    ],
                  ),
                ),
              ),
            if (!loading && !error && movieList.isNotEmpty)
              Expanded(
                child: EListView(
                  onLoadMore: () async =>
                      fetchData(refresh: false, showLoading: false),
                  onRefresh: () async =>
                      fetchData(refresh: true, showLoading: true),
                  itemCount: movieList.length,
                  itemBuilder: (context, index) {
                    return EMovieCard(movie: movieList[index]);
                  },
                ),
              )
          ],
        ),
      ),
    );
  }

  void search(String query) {
    this.query = query;
    if (query.length > 2) {
      timer?.cancel();
      timer = Timer(const Duration(milliseconds: 500), () async {
        unawaited(fetchData(refresh: true, showLoading: true));
      });
    } else {
      movieList = [];
      setState(() {});
    }
  }

  Future<void> fetchData({
    required bool refresh,
    required bool showLoading,
  }) async {
    if (refresh) {
      page = 1;
      movieList = [];
    }
    loading = showLoading;
    error = false;
    setState(() {});
    try {
      final includeAdult = ref.read(appProvider).includeAdult;
      final language = ref.read(appProvider).language;
      final res = await _movieService.search(
        query: query,
        page: page + 1,
        includeAdult: includeAdult,
        language: language,
      );
      page++;
      movieList = [...movieList, ...res.results];
    } catch (e) {
      error = true;
    } finally {
      loading = false;
    }
    setState(() {});
  }
}
