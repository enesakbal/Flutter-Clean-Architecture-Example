part of '../../view/movie_detail_view.dart';

class _ActorCard extends StatelessWidget {
  const _ActorCard({required this.castEntity});

  final CastEntity? castEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => SocialMediaBottomSheet(
        actorId: castEntity?.id?.toString(),
        actorName: castEntity?.name,
      ).show(context),
      borderRadius: BorderRadius.circular(12.r),
      child: DecoratedBox(
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
                child: BaseNetworkImage.originalImageSize(
                  castEntity?.profilePath,
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
      ),
    );
  }
}
