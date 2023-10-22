import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/indicator/base_indicator.dart';
import '../../domain/entities/export_entities.dart';
import '../_widget/movies/movie_card.dart';
import '../cubit/movie/get_saved_movies/get_saved_movies_cubit.dart';

@RoutePage()
class BookmarksView extends StatelessWidget {
  const BookmarksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSavedMoviesCubit, GetSavedMoviesState>(
      builder: (_, getSavedMoviesState) {
        if (getSavedMoviesState is GetSavedMoviesLoaded) {
          return _BookmarksView(getSavedMoviesState.movies);
        }

        return const BaseIndicator();
      },
    );
  }
}

class _BookmarksView extends StatelessWidget {
  const _BookmarksView(this.movies);

  final List<MovieDetailEntity>? movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        itemCount: movies?.length ?? 0,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return MovieCard(
            movie: movies?[index],
          );
        },
      ),
    );
  }
}
