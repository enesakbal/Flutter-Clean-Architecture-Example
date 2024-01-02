// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter_clean_architecture/src/domain/entities/export_entities.dart'
    as _i7;
import 'package:flutter_clean_architecture/src/presentation/view/bookmarks_view.dart'
    as _i1;
import 'package:flutter_clean_architecture/src/presentation/view/master_view.dart'
    as _i2;
import 'package:flutter_clean_architecture/src/presentation/view/movie_detail_view.dart'
    as _i3;
import 'package:flutter_clean_architecture/src/presentation/view/movies_view.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    BookmarksRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BookmarksView(),
      );
    },
    MasterRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MasterView(),
      );
    },
    MovieDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.MovieDetailView(
          key: args.key,
          movieDetail: args.movieDetail,
          heroTag: args.heroTag,
        ),
      );
    },
    MoviesRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MoviesView(),
      );
    },
  };
}

/// generated route for
/// [_i1.BookmarksView]
class BookmarksRoute extends _i5.PageRouteInfo<void> {
  const BookmarksRoute({List<_i5.PageRouteInfo>? children})
      : super(
          BookmarksRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarksRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MasterView]
class MasterRoute extends _i5.PageRouteInfo<void> {
  const MasterRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MasterRoute.name,
          initialChildren: children,
        );

  static const String name = 'MasterRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MovieDetailView]
class MovieDetailRoute extends _i5.PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    _i6.Key? key,
    required _i7.MovieDetailEntity? movieDetail,
    required Object heroTag,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          MovieDetailRoute.name,
          args: MovieDetailRouteArgs(
            key: key,
            movieDetail: movieDetail,
            heroTag: heroTag,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailRoute';

  static const _i5.PageInfo<MovieDetailRouteArgs> page =
      _i5.PageInfo<MovieDetailRouteArgs>(name);
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({
    this.key,
    required this.movieDetail,
    required this.heroTag,
  });

  final _i6.Key? key;

  final _i7.MovieDetailEntity? movieDetail;

  final Object heroTag;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{key: $key, movieDetail: $movieDetail, heroTag: $heroTag}';
  }
}

/// generated route for
/// [_i4.MoviesView]
class MoviesRoute extends _i5.PageRouteInfo<void> {
  const MoviesRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoviesRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
