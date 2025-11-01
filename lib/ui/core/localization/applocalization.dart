import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  static AppLocalization of(BuildContext context) {
    return Localizations.of(context, AppLocalization)!;
  }

  static const _strings = <String, String>{
    'close': 'Close',
    'confirm': 'Confirm',
    'login': 'Login',
    'tryAgain': 'Try again',
    'profile.edit.button': 'Edit profile'
  };

  // If string for "label" does not exist, will show "[LABEL]"
  static String _get(String label) =>
      _strings[label] ?? '[${label.toUpperCase()}]';

  String get close => _get('close');

  String get confirm => _get('confirm');

  String get login => _get('login');

  String get tryAgain => _get('tryAgain');

  String get profileEditButton => _get('profile.edit.button');

}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture(AppLocalization());
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}