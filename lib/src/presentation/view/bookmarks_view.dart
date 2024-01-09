import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/router/app_router.gr.dart';
import '../../core/components/buttons/retry_button.dart';
import '../../core/components/card/movie_card.dart';
import '../../core/components/indicator/base_indicator.dart';
import '../../domain/entities/export_entities.dart';
import '../cubit/movie/get_saved_movies/get_saved_movies_cubit.dart';

@RoutePage()
class BookmarksView extends StatelessWidget {
  const BookmarksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSavedMoviesCubit, GetSavedMoviesState>(
      builder: (_, getSavedMoviesState) {
        return switch (getSavedMoviesState) {
          GetSavedMoviesLoaded() => _BookmarksView(getSavedMoviesState.movies),
          GetSavedMoviesError() => Padding(
              padding: const EdgeInsets.all(12).r,
              child: RetryButton(
                retryAction: () => context.read<GetSavedMoviesCubit>().getSavedMovieDetails(),
                text: getSavedMoviesState.message,
              ),
            ),
          _ => const BaseIndicator(),
        };
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
      body: Builder(builder: (context) {
        if (movies?.isEmpty ?? true) {
          return Center(
            child: Text(
              'There is no bookmarked movie yet.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }

        return GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          itemCount: movies?.length ?? 0,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final tag = UniqueKey();

            return GestureDetector(
              onTap: () => context.router.push(MovieDetailRoute(movieDetail: movies?[index], heroTag: tag)),
              child: Hero(tag: tag, child: MovieCard(movie: movies?[index])),
            );
          },
        );
      }),
    );
  }
}
