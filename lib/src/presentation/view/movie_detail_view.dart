import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/image/base_network_image.dart';
import '../../core/constants/image_constants.dart';
import '../../core/extensions/int_extensions.dart';
import '../../domain/entities/export_entities.dart';

part '../_widget/movie_detail/tag_container.dart';

@RoutePage()
class MovieDetailView extends StatelessWidget {
  const MovieDetailView({super.key, required this.movieDetail, required this.heroTag});

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
            SliverAppBar(
              floating: true,
              expandedHeight: 500,
              collapsedHeight: kToolbarHeight,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: BaseNetworkImage(
                  ImageConstants.getOriginalImagePath(posterPath: movieDetail?.posterPath),
                  hasRadius: false,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 1.sh - kToolbarHeight - MediaQuery.of(context).padding.top,
                width: 1.sw,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              movieDetail?.title ?? '',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text('${movieDetail?.voteAverage}'),
                        ],
                      ),
                      20.verticalSpace,
                      Flexible(child: Text(movieDetail?.overview ?? '')),
                      20.verticalSpace,
                      Flexible(
                        child: BaseNetworkImage(
                          ImageConstants.getOriginalImagePath(posterPath: movieDetail?.backdropPath),
                        ),
                      ),
                      20.verticalSpace,
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: movieDetail?.genreIds?.length ?? 0,
                          itemBuilder: (context, index) {
                            return TagContainer('${movieDetail?.genreIds?[index].getGenreFromNumber()}');
                          },
                          separatorBuilder: (context, index) => 10.horizontalSpace,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
