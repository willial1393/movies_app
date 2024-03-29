import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/app/providers/app_provider.dart';
import 'package:movies_app/app/router/router.dart';
import 'package:movies_app/app/theme/colors.dart';
import 'package:movies_app/app/types/date.dart';
import 'package:movies_app/app/types/movie.dart';
import 'package:movies_app/app/widgets/e_picture.dart';
import 'package:movies_app/core/models/movie_genre/movie_genre.dart';
import 'package:movies_app/core/models/movie_list/movie_list.dart';

class EMovieCard extends ConsumerWidget {
  final MovieList movie;
  final VoidCallback? onDelete;

  const EMovieCard({
    required this.movie,
    this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(
      appProvider.select((value) => value.genres),
    );
    return InkWell(
      onTap: () async {
        await appRouter.push(MovieDetailRoute(id: movie.id));
      },
      child: Container(
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
                path: movie.posterPath.toMoviePath,
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
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          movie.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (onDelete != null)
                        IconButton(
                          onPressed: onDelete,
                          icon: const Icon(
                            Icons.delete,
                            color: EColor.red,
                          ),
                        ),
                    ],
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
                    movie.genreIds
                        .map((e) => genres
                            .firstWhere((element) => element.id == e,
                                orElse: () => MovieGenre(id: 0, name: ''))
                            .name)
                        .join(', '),
                    style: const TextStyle(color: EColor.grey),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
          ],
        ),
      ),
    );
  }
}
