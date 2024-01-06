import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/app/router/router.dart';
import 'package:movies_app/app/widgets/e_loading.dart';
import 'package:movies_app/app/widgets/e_movie_card.dart';
import 'package:movies_app/app/widgets/e_notification.dart';
import 'package:movies_app/app/widgets/e_scaffold.dart';
import 'package:movies_app/core/interfaces/storage_interface.dart';
import 'package:movies_app/core/models/movie_detail/movie_detail.dart';
import 'package:movies_app/core/models/movie_list/movie_list.dart';
import 'package:movies_app/injection.dart';

@RoutePage()
class MovieSavedScreen extends StatelessWidget {
  const MovieSavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EScaffold(
      onBack: () {
        appRouter.back();
      },
      title: 'Películas Guardadas',
      body: FutureBuilder<List<MovieDetail>>(
          future: getIt<StorageInterface>().getSavedMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No hay películas guardadas'),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data![index];
                  final movie = MovieList(
                    adult: data.adult,
                    backdropPath: data.backdropPath,
                    genreIds: data.genres.map((e) => e.id).toList(),
                    id: data.id,
                    originalLanguage: data.originalLanguage,
                    originalTitle: data.originalTitle,
                    overview: data.overview,
                    popularity: data.popularity,
                    posterPath: data.posterPath,
                    releaseDate: data.releaseDate,
                    title: data.title,
                    video: data.video,
                    voteAverage: data.voteAverage,
                    voteCount: data.voteCount,
                  );
                  return EMovieCard(
                    movie: movie,
                    onDelete: () async {
                      getIt<StorageInterface>().removeMovie(data);
                      ENotification.success('Película eliminada');
                      await appRouter.popAndPush(const MovieSavedRoute());
                    },
                  );
                },
              );
            }
            return const ELoading();
          }),
    );
  }
}
