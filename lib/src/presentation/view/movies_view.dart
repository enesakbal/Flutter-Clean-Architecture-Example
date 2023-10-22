import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/indicator/base_indicator.dart';
import '../../domain/entities/export_entities.dart';
import '../_widget/movies/movie_card.dart';
import '../cubit/movie/get_popular_movies/get_popular_movies_cubit.dart';
import '../cubit/movie/get_top_rated_movies/get_top_rated_movies_cubit.dart';

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
            Tab(text: 'Upcoming'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabbarController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          BlocBuilder<GetPopularMoviesCubit, GetPopularMoviesState>(
            builder: (context, getPopularMoviesState) {
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
