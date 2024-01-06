import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/app/router/router.dart';
import 'package:movies_app/app/theme/colors.dart';
import 'package:movies_app/app/types/date.dart';
import 'package:movies_app/app/types/movie.dart';
import 'package:movies_app/app/widgets/e_picture.dart';
import 'package:movies_app/core/models/movie_list/movie_list.dart';

class EMovieCard extends StatelessWidget {
  final MovieList movie;

  const EMovieCard({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    movie.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
