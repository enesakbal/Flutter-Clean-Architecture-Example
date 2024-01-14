import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/components/bottom_sheet/social_media_bottom_sheet.dart';
import '../../core/components/buttons/bookmark_button.dart';
import '../../core/components/image/base_network_image.dart';
import '../../core/extensions/int_extensions.dart';
import '../../domain/entities/export_entities.dart';
import '../cubit/movie/get_movie_credits/get_movie_credits_cubit.dart';

part '../_widget/movie_detail/actor_card.dart';
part '../_widget/movie_detail/tag_container.dart';

@RoutePage()
class MovieDetailView extends StatelessWidget {
  const MovieDetailView({super.key, required this.movieDetail, required this.heroTag});

  final MovieDetailEntity? movieDetail;
  final Object heroTag;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<GetMovieCreditsCubit>()..getMovieCredits(movieDetail?.id ?? 0),
      child: _MovieDetailView(movieDetail: movieDetail, heroTag: heroTag),
    );
  }
}

class _MovieDetailView extends StatelessWidget {
  const _MovieDetailView({required this.movieDetail, required this.heroTag});

  final MovieDetailEntity? movieDetail;
  final Object heroTag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Scaffold(
        body: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            //* Appbar
            SliverAppBar(
              expandedHeight: 500,
              collapsedHeight: kToolbarHeight,
              pinned: true,
              actions: [BookmarkButton.filled(movieDetailEntity: movieDetail)],
              flexibleSpace: FlexibleSpaceBar(
                background: BaseNetworkImage.originalImageSize(
                  movieDetail?.posterPath,
                  hasRadius: false,
                ),
              ),
            ),

            //* Body
            SliverToBoxAdapter(
              child: SizedBox(
                height: 1.sh - kToolbarHeight - MediaQuery.of(context).padding.top,
                width: 1.sw,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(12).r,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //* Title
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movieDetail?.title ?? '',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                5.verticalSpace,
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Text(
                                        movieDetail?.voteAverage?.toString().substring(0, 3) ?? '',
                                        style: Theme.of(context).textTheme.titleMedium,
                                      ),
                                      5.horizontalSpace,
                                      const Icon(Icons.star, size: 15),
                                      10.horizontalSpace,
                                      Text('·',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(fontWeight: FontWeight.w900)),
                                      10.horizontalSpace,
                                      Text(
                                        DateFormat('yyyy').format(
                                            DateTime.tryParse(movieDetail?.releaseDate ?? '') ?? DateTime.now()),
                                        style: Theme.of(context).textTheme.titleMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            20.verticalSpace,

                            //* Overview
                            Flexible(child: SingleChildScrollView(child: Text('${movieDetail?.overview}'))),

                            20.verticalSpace,

                            //* Backdrop
                            Flexible(
                              child: BaseNetworkImage.originalImageSize(movieDetail?.backdropPath),
                            ),

                            20.verticalSpace,
                          ],
                        ),
                      ),
                    ),

                    //* Tags
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: movieDetail?.genreIds?.length ?? 0,
                        padding: const EdgeInsets.symmetric(horizontal: 12).r,
                        itemBuilder: (context, index) {
                          return _TagContainer('${movieDetail?.genreIds?[index].getGenreFromNumber()}');
                        },
                        separatorBuilder: (context, index) => 10.horizontalSpace,
                      ),
                    ),

                    20.verticalSpace,

                    //* Cast
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10).r,
                      child: Text(
                        'Cast',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    SafeArea(
                      top: false,
                      child: BlocBuilder<GetMovieCreditsCubit, GetMovieCreditsState>(
                        builder: (context, state) {
                          if (state is! GetMovieCreditsLoaded) {
                            return Shimmer.fromColors(
                              baseColor: Theme.of(context).primaryColorDark,
                              highlightColor: Theme.of(context).primaryColor,
                              child: SizedBox(
                                height: 70.h,
                                width: 1.sw,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(horizontal: 12).r,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, __) => Container(
                                    height: 70.h,
                                    width: 225.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: Colors.white,
                                    ),
                                  ),
                                  separatorBuilder: (_, __) => SizedBox(width: 30.w),
                                  itemCount: 4,
                                ),
                              ),
                            );
                          }

                          return SizedBox(
                            height: 70.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(horizontal: 12).r,
                              itemBuilder: (_, index) => SizedBox(
                                height: 70.h,
                                width: 225.w,
                                child: _ActorCard(castEntity: state.movieCreditEntity.cast?[index]),
                              ),
                              separatorBuilder: (_, __) => SizedBox(width: 30.w),
                              itemCount: state.movieCreditEntity.cast?.length ?? 0,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
