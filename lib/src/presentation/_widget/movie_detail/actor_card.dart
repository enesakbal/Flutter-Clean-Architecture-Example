import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/image/base_network_image.dart';
import '../../../core/constants/image_constants.dart';
import '../../../domain/entities/export_entities.dart';

class ActorCard extends StatelessWidget {
  const ActorCard({
    super.key,
    required this.castEntity,
  });

  final CastEntity? castEntity;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Theme.of(context).disabledColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            ),
            child: SizedBox(
              width: 65.w,
              child: BaseNetworkImage(
                ImageConstants.getOriginalImagePath(posterPath: castEntity?.profilePath),
                hasRadius: false,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${castEntity?.name}',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  5.verticalSpace,
                  Text(
                    '${castEntity?.character}',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
