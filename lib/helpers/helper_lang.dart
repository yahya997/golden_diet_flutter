import 'package:flutter/material.dart';
import 'package:golden_diet/lang/app_locale.dart';

String getTranslated (BuildContext context , String key){
  return AppLocale.of(context).getTranslated(key)!;
}

String getLang(BuildContext context){
  return Localizations.localeOf(context).languageCode;
}