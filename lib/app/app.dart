import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:coffee_shop/screen/app_router.dart';
import 'package:coffee_shop/utils/router/route_name.dart';
import 'package:coffee_shop/utils/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      dark: AppTheme.darkTheme,
      light: AppTheme.lightTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkThem) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            ScreenUtil.init(context);
            return MaterialApp(
              locale: context.locale,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              initialRoute: RouteName.splash,
              onGenerateRoute: AppRouter.generateRoute,
              debugShowCheckedModeBanner: false,
              title: 'Coffee Shop',
              theme: theme,
              darkTheme: darkThem,
            );
          },
        );
      },
    );
  }
}
