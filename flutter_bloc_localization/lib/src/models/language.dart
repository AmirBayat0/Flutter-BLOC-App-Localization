import 'dart:ui';

import '../../gen/assets.gen.dart';

enum Language {
  english(
    Locale('en', 'US'),
    Assets.english,
    'English',
  ),
  dutch(
    Locale('nl', 'NL'),
    Assets.dutch,
    'Dutch',
  ),
  german(
    Locale('de', 'DE'),
    Assets.german,
    'German',
  );

  const Language(this.value, this.image, this.text);

  final Locale value;
  final AssetGenImage image;
  final String text;
}
