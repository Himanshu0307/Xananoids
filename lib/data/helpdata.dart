import 'dart:js';

import 'package:flutter/material.dart';
import '../fonts/social_icon_icons.dart';
import 'package:url_launcher/url_launcher.dart';

final List<Map<String, Object>> actions = [
  {
    'Icon': Icons.call,
    'title': 'Call',
    'subtitle': 'Having Issues!!!, Contact us at',
    'button_text': 'Call +918003412098',
    'fun_to_call': () {
      Url_launcher(url: 'tel:+918003412098');
    }
  },
  {
    'Icon': Icons.mail,
    'title': 'Mail',
    'subtitle': 'Contact us using mail and we will be right back asap',
    'button_text': 'Email Xananoids@gmail.com',
    'fun_to_call': () {
      Url_launcher(url: 'mailto:Xananoids@gmail.com');
    }
  },
];

void Url_launcher({@required String url, BuildContext context}) async {
  if (await canLaunch(url))
    launch(url);
  else
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'This feature is not available on this platform. Please use alternatives to contact us')));
}
