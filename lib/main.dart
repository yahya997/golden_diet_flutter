import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:golden_diet/features/register/login_screen.dart';
import 'package:golden_diet/features/splash/splash_screen.dart';
import 'package:golden_diet/get_it.dart';
import 'package:golden_diet/lang/app_locale.dart';
import 'package:golden_diet/routing/navigation_service.dart';
import 'package:golden_diet/utils/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'routing/router.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Golden Diet',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Tajawal'
        ),
          localizationsDelegates: [
            AppLocale.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('ar', ''),
          ],
          localeResolutionCallback: (currentLocale, supportedLocales) {
            if (currentLocale != null) {
              for (var locale in supportedLocales) {
                if (currentLocale.languageCode == locale.languageCode) {
                  return currentLocale;
                }
              }
            }
            return supportedLocales.first;
          },
          locale: Locale('ar'),
        navigatorKey: getIt<NavigationService>().navigatorKey,
        initialRoute: SplashScreen.id,
        onGenerateRoute: router.Router.generateRoute,
      );
      },
    );
  }
}

