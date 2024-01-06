import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../core/components/bottom_sheet/_mixin/base_bottom_sheet_mixin.dart';
import '../../../core/components/buttons/social_button.dart';
import '../../../core/components/indicator/base_indicator.dart';
import '../../cubit/actor/export_actor_cubits.dart';

class SocialMediaBottomSheet extends StatelessWidget with BaseBottomSheetMixin {
  const SocialMediaBottomSheet({super.key, required this.actorId});

  final String? actorId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<GetActorSocialMediaCubit>()..getActorSocialMedia(actorId: actorId ?? '0'),
      child: const _SocialMediaBottomSheet(),
    );
  }
}

class _SocialMediaBottomSheet extends StatelessWidget {
  const _SocialMediaBottomSheet();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 1.sw,
        height: 0.2.sh,
        child: BlocBuilder<GetActorSocialMediaCubit, GetActorSocialMediaState>(
          builder: (context, state) {
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

            return Row(
              children: [
                if (list[0] != null) Expanded(child: SocialButton.instagram(id: state.instagramId)),
                if (list[1] != null) Expanded(child: SocialButton.twitter(id: state.twitterId)),
                if (list[2] != null) Expanded(child: SocialButton.facebook(id: state.facebookId)),
                if (list[3] != null) Expanded(child: SocialButton.youtube(id: state.youtubeId)),
                if (list[4] != null) Expanded(child: SocialButton.imdb(id: state.imdbId)),
                if (list[5] != null) Expanded(child: SocialButton.tiktok(id: state.tiktokId)),
              ],
            );
          },
        ),
      ),
    );
  }
}
