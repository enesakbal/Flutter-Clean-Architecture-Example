import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/router/app_router.gr.dart';
import '../../core/components/buttons/retry_button.dart';
import '../../core/components/card/movie_card.dart';
import '../../core/components/indicator/base_indicator.dart';
import '../../domain/entities/export_entities.dart';
import '../cubit/movie/export_movie_cubits.dart';

part '../_widget/movies/movie_listing_widget.dart';

@RoutePage()
class MoviesView extends HookWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabbarController = useTabController(initialLength: 2);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        bottom: TabBar(
          controller: tabbarController,
          tabs: const [
            Tab(text: 'Popular'),
            Tab(text: 'Top Rated'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabbarController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          BlocBuilder<GetPopularMoviesCubit, GetPopularMoviesState>(
            builder: (context, getPopularMoviesState) {
              if (getPopularMoviesState is GetPopularMoviesError) {
                return Padding(
                  padding: const EdgeInsets.all(12).r,
                  child: RetryButton(
                    text: getPopularMoviesState.message,
                    retryAction: context.read<GetPopularMoviesCubit>().getPopularMovies,
                  ),
                );
              }

              if (getPopularMoviesState is GetPopularMoviesLoaded) {
                return _MovieListingWidget(
                  hasReachedMax: context.watch<GetPopularMoviesCubit>().hasReachedMax,
                  movies: getPopularMoviesState.movies,
                  whenScrollBottom: () async => context.read<GetPopularMoviesCubit>().getPopularMovies(),
                );
              }

              return const BaseIndicator();
            },
          ),
          BlocBuilder<GetTopRatedMoviesCubit, GetTopRatedMoviesState>(
            builder: (context, getTopRatedMoviesState) {
              if (getTopRatedMoviesState is GetTopRatedMoviesError) {
                return Padding(
                  padding: const EdgeInsets.all(12).r,
                  child: RetryButton(
                    text: getTopRatedMoviesState.message,
                    retryAction: context.read<GetTopRatedMoviesCubit>().getTopRatedMovies,
                  ),
                );
              }

              if (getTopRatedMoviesState is GetTopRatedMoviesLoaded) {
                return _MovieListingWidget(
                  hasReachedMax: context.watch<GetTopRatedMoviesCubit>().hasReachedMax,
                  movies: getTopRatedMoviesState.movies,
                  whenScrollBottom: () async => context.read<GetTopRatedMoviesCubit>().getTopRatedMovies(),
                );
              }

              return const BaseIndicator();
            },
          ),
        ],
      ),
    );
  }
}
