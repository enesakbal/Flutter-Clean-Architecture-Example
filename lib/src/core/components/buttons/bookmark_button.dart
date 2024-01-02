import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/entities/export_entities.dart';
import '../../../presentation/cubit/movie/get_saved_movies/get_saved_movies_cubit.dart';
import '../../../presentation/cubit/movie/toggle_bookmark/toggle_bookmark_cubit.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
    required this.movieDetailEntity,
    super.key,
  });

  final MovieDetailEntity? movieDetailEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSavedMoviesCubit, GetSavedMoviesState>(
      builder: (_, getSavedMoviesState) {
        if (getSavedMoviesState is GetSavedMoviesLoaded) {
          bool isBookmarked =
              getSavedMoviesState.movies?.any((element) => element.id == movieDetailEntity?.id) ?? false;

          return IconButton(
            onPressed: () async {
              await GetIt.I<ToggleBookmarkCubit>()
                  .toggleBookmark(movieDetailEntity: movieDetailEntity)
                  .then((_) => context.read<GetSavedMoviesCubit>().getSavedMovieDetails());

              isBookmarked = !isBookmarked;
            },
            icon: AnimatedCrossFade(
              firstChild: Icon(
                Icons.bookmark,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
              secondChild: Icon(
                Icons.bookmark_border,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
              crossFadeState: isBookmarked ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: kThemeAnimationDuration,
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
