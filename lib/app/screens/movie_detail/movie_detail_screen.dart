import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/app/providers/app_provider.dart';
import 'package:movies_app/app/router/router.dart';
import 'package:movies_app/app/screens/movie_detail/widgets/movie_detail_header.dart';
import 'package:movies_app/app/types/date.dart';
import 'package:movies_app/app/widgets/e_loading.dart';
import 'package:movies_app/app/widgets/e_scaffold.dart';
import 'package:movies_app/core/interfaces/movie_interface.dart';
import 'package:movies_app/core/models/movie_detail/movie_detail.dart';
import 'package:movies_app/injection.dart';

@RoutePage()
class MovieDetailScreen extends ConsumerWidget {
  final int id;

  const MovieDetailScreen({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(appProvider.select((value) => value.language));
    return EScaffold(
      onBack: () {
        appRouter.back();
      },
      title: 'Detalle',
      body: FutureBuilder<MovieDetail>(
        future: getIt<MovieInterface>().detail(id: id, language: language),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final movie = snapshot.data!;
            return Column(
              children: [
                MovieDetailHeader(movie: movie),
                SizedBox(height: 10.h),
                Text(
                  movie.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(movie.releaseDate.toDateFormat()),
                SizedBox(height: 10.h),
                Text('Puntuación: ${movie.voteAverage}'),
                Text(movie.genres.map((e) => e.name).join(', ')),
                SizedBox(height: 10.h),
                Text('Duración: ${movie.runtime} min'),
                Text('Idioma: ${movie.originalLanguage}'),
                Text(
                    'País: ${movie.productionCountries.map((e) => e.name).join(', ')}'),
                SizedBox(height: 10.h),
                const Text('Descripción:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.w),
                    child: SingleChildScrollView(
                      child: Text(movie.overview),
                    ),
                  ),
                ),
              ],
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: InkWell(
                onTap: () {
                  appRouter.back();
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Ocurrio un error'),
                        SizedBox(height: 5.h),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_back_ios),
                            Text('Volver'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const ELoading();
        },
      ),
    );
  }
}
