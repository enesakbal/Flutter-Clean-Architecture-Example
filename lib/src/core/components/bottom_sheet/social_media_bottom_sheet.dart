import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../presentation/cubit/actor/export_actor_cubits.dart';
import '../buttons/retry_button.dart';
import '../buttons/social_button.dart';
import '../indicator/base_indicator.dart';
import '_mixin/base_bottom_sheet_mixin.dart';

class SocialMediaBottomSheet extends StatelessWidget with BaseBottomSheetMixin {
  const SocialMediaBottomSheet({super.key, required this.actorId, required this.actorName});

  final String? actorId;
  final String? actorName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<GetActorSocialMediaCubit>()..getActorSocialMedia(actorId: actorId ?? '0'),
      child: _SocialMediaBottomSheet(actorId ?? '0', actorName: actorName),
    );
  }
}

class _SocialMediaBottomSheet extends StatelessWidget {
  const _SocialMediaBottomSheet(this.actorId, {required this.actorName});
  final String actorId;
  final String? actorName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 1.sw,
        height: 0.25.sh,
        child: BlocBuilder<GetActorSocialMediaCubit, GetActorSocialMediaState>(
          builder: (context, state) {
            if (state is GetActorSocialMediaError) {
              return RetryButton(
                text: state.message,
                retryAction: () => context.read<GetActorSocialMediaCubit>().getActorSocialMedia(actorId: actorId),
              );
            }

            if (state is! GetActorSocialMediaLoaded) return const BaseIndicator();

            final list = [
              state.instagramId,
              state.twitterId,
              state.facebookId,
              state.youtubeId,
              state.imdbId,
              state.tiktokId,
            ];

            if (list.every((element) => element == null)) {
              return const Center(child: Text('Social media account not found'));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$actorName's social accounts",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                ),
                const Divider(),
                Expanded(
                  child: Row(
                    children: [
                      if (list[0] != null) Expanded(child: SocialButton.instagram(id: state.instagramId)),
                      if (list[1] != null) Expanded(child: SocialButton.twitter(id: state.twitterId)),
                      if (list[2] != null) Expanded(child: SocialButton.facebook(id: state.facebookId)),
                      if (list[3] != null) Expanded(child: SocialButton.youtube(id: state.youtubeId)),
                      if (list[4] != null) Expanded(child: SocialButton.imdb(id: state.imdbId)),
                      if (list[5] != null) Expanded(child: SocialButton.tiktok(id: state.tiktokId)),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
