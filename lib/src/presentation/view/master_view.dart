import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../config/router/app_router.gr.dart';
import '../../core/theme/cubit/theme_cubit.dart';
import '../cubit/movie/export_movie_cubits.dart';

@RoutePage()
class MasterView extends StatelessWidget {
  const MasterView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.I<GetPopularMoviesCubit>()..getPopularMovies()),
        BlocProvider(create: (context) => GetIt.I<GetTopRatedMoviesCubit>()..getTopRatedMovies()),
      ],
      child: AutoTabsScaffold(
        resizeToAvoidBottomInset: true,
        lazyLoad: false,
        animationDuration: const Duration(milliseconds: 100),
        appBarBuilder: (context, tabsRouter) {
          return AppBar(
            title: Text(tabsRouter.current.title.call(context)),
            actions: [
              // // AnimatedIcon(icon: animated, progress: progress)
              // Switch(
              //   value: false,
              //   onChanged: (value) {},
              // )
              IconButton(
                onPressed: () => context.read<ThemeCubit>().toggleTheme(brightness: Theme.of(context).brightness),
                icon: Icon(
                  Theme.of(context).brightness == Brightness.dark
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                ),
              ),
            ],
            elevation: 0,
          );
        },
        routes: const [
          MoviesRoute(),
          BookmarksRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            onTap: tabsRouter.setActiveIndex,
            currentIndex: tabsRouter.activeIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'Movies',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Bookmarks',
              ),
            ],
          );
        },
      ),
    );
  }
}
