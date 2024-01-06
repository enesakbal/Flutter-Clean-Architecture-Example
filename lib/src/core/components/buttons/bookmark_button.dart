import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/entities/export_entities.dart';
import '../../../presentation/cubit/movie/get_saved_movies/get_saved_movies_cubit.dart';
import '../../../presentation/cubit/movie/toggle_bookmark/toggle_bookmark_cubit.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({super.key, required this.movieDetailEntity}) : _buttonStyle = null;

  BookmarkButton.filled({super.key, required this.movieDetailEntity})
      : _buttonStyle = ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8).r)),
          elevation: MaterialStateProperty.all<double>(1.5),
          shadowColor: MaterialStateProperty.all<Color>(Colors.black87),
        );

  final MovieDetailEntity? movieDetailEntity;

  final ButtonStyle? _buttonStyle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSavedMoviesCubit, GetSavedMoviesState>(
      builder: (_, getSavedMoviesState) {
        if (getSavedMoviesState is GetSavedMoviesLoaded) {
          bool isBookmarked =
              getSavedMoviesState.movies?.any((element) => element.id == movieDetailEntity?.id) ?? false;

          return IconButton(
            style: _buttonStyle,
            padding: EdgeInsets.zero,
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
