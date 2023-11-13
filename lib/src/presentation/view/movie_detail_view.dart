import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/components/indicator/base_indicator.dart';
import '../../core/constants/image_constants.dart';
import '../../domain/entities/export_entities.dart';

@RoutePage()
class MovieDetailView extends StatelessWidget {
  const MovieDetailView({super.key, required this.movieDetail, required this.heroTag});

  final MovieDetailEntity? movieDetail;
  final Object heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movieDetail?.title ?? '',
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: CachedNetworkImage(
          imageUrl: ImageConstants.getOriginalImagePath(posterPath: movieDetail?.posterPath ?? ''),
          progressIndicatorBuilder: (context, url, progress) => const BaseIndicator(),
          imageBuilder: (context, imageProvider) {
            return Hero(
              tag: heroTag,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
