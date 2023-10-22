// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter_clean_architecture/src/presentation/view/bookmarks_view.dart'
    as _i1;
import 'package:flutter_clean_architecture/src/presentation/view/master_view.dart'
    as _i2;
import 'package:flutter_clean_architecture/src/presentation/view/movies_view.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    BookmarksRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BookmarksView(),
      );
    },
    MasterRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MasterView(),
      );
    },
    MoviesRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MoviesView(),
      );
    },
  };
}

/// generated route for
/// [_i1.BookmarksView]
class BookmarksRoute extends _i4.PageRouteInfo<void> {
  const BookmarksRoute({List<_i4.PageRouteInfo>? children})
      : super(
          BookmarksRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarksRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MasterView]
class MasterRoute extends _i4.PageRouteInfo<void> {
  const MasterRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MasterRoute.name,
          initialChildren: children,
        );

  static const String name = 'MasterRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MoviesView]
class MoviesRoute extends _i4.PageRouteInfo<void> {
  const MoviesRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoviesRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
