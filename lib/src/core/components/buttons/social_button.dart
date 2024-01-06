import 'package:flutter/material.dart';

import '../../../config/gen/assets.gen.dart';
import '../../utils/url_launcher_manager.dart';

class SocialButton extends StatelessWidget {
  final Widget icon;
  final void Function() onPressed;
  final String? id;

  SocialButton.instagram({super.key, required this.id})
      : icon = Assets.icons.instagram.svg(height: 60),
        onPressed = (() async => UrlLauncherManager.redirectToInstagramById(id ?? ''));

  SocialButton.twitter({super.key, required this.id})
      : icon = Assets.icons.twitter.svg(height: 60),
        onPressed = (() async => UrlLauncherManager.redirectToTwitterById(id ?? ''));

  SocialButton.facebook({super.key, required this.id})
      : icon = Assets.icons.facebook.svg(height: 60),
        onPressed = (() async => UrlLauncherManager.redirectToFacebookById(id ?? ''));

  SocialButton.youtube({super.key, required this.id})
      : icon = Assets.icons.youtube.svg(height: 60),
        onPressed = (() async => UrlLauncherManager.redirectToYoutubeById(id ?? ''));

  SocialButton.imdb({super.key, required this.id})
      : icon = Assets.icons.imdb.svg(height: 60),
        onPressed = (() async => UrlLauncherManager.redirectToImdbById(id));

  SocialButton.tiktok({super.key, required this.id})
      : icon = Assets.icons.tiktok.svg(height: 60),
        onPressed = (() async => UrlLauncherManager.redirectToTiktokById(id));

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icon);
  }
}
