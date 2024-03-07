import 'package:coffee_shop/app/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      EasyLocalization(
      supportedLocales: const [
        Locale("uz", "UZ"),
        Locale("en", "US"),
      ],
      path: "assets/translation",
      fallbackLocale: const Locale("uz", "UZ"),
      child: MyApp(),
    ),
  );
}



