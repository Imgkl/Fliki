import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

share(BuildContext ctx, String extract, String url) {
  Share.share(
    "Found this Interesting article on Wikipedia\n\n${extract != null ? extract : ""}\n\n$url",
    subject: "Found this Interesting article on Wikipedia",
  );
}
