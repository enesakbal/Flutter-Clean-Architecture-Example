import 'dart:developer';

import 'package:url_launcher/url_launcher_string.dart';

class UrlLauncherManager {
  static Future<void> redirectUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      log('Could not launch $url');
    }
  }

  static Future<void> redirectToInstagramById(String? id) async {
    final url = 'https://www.instagram.com/$id';

    await redirectUrl(url);
  }

  static Future<void> redirectToTwitterById(String? id) async {
    final url = 'https://twitter.com/$id';

    await redirectUrl(url);
  }

  static Future<void> redirectToFacebookById(String? id) async {
    final url = 'https://www.facebook.com/$id';

    await redirectUrl(url);
  }

  static Future<void> redirectToYoutubeById(String? id) async {
    final url = 'https://www.youtube.com/channel/$id';

    await redirectUrl(url);
  }

  static Future<void> redirectToImdbById(String? id) async {
    final url = 'https://www.imdb.com/name/$id';

    await redirectUrl(url);
  }

  static Future<void> redirectToTiktokById(String? id) async {
    final url = 'https://www.tiktok.com/@$id';

    await redirectUrl(url);
  }
}
