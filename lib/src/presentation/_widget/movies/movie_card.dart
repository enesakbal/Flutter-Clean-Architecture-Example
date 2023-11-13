import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/buttons/bookmark_button.dart';
import '../../../core/components/indicator/base_indicator.dart';
import '../../../core/constants/image_constants.dart';
import '../../../domain/entities/export_entities.dart';
import '../../cubit/movie/export_movie_cubits.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, this.movie});
  final MovieDetailEntity? movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: CachedNetworkImage(
        imageUrl: ImageConstants.getOriginalImagePath(posterPath: movie?.posterPath ?? ''),
        progressIndicatorBuilder: (context, url, progress) => const BaseIndicator(),
        imageBuilder: (context, imageProvider) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: BlocBuilder<GetSavedMoviesCubit, GetSavedMoviesState>(
                      builder: (context, state) {
                        if (state is GetSavedMoviesLoaded) {
                          return BookmarkButton(
                            movieDetailEntity: movie,
                          );
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: 1.sw,
                        height: 40.h,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black.withOpacity(0.8), Colors.black.withOpacity(0.0)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Text(
                          movie?.title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
