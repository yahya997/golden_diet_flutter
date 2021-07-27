import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_diet/features/home/home_bloc/home_bloc.dart';
import 'package:golden_diet/features/home/home_screen.dart';
import 'package:golden_diet/features/register/enter_health_record_screen.dart';
import 'package:golden_diet/features/register/enter_location_screen.dart';
import 'package:golden_diet/features/register/forgot_password_screen.dart';
import 'package:golden_diet/features/register/login_screen.dart';
import 'package:golden_diet/features/register/register_screen.dart';
import 'package:golden_diet/features/splash/intro_screen.dart';
import 'package:golden_diet/features/splash/splash_screen.dart';
import 'package:golden_diet/get_it.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.id:
        return MaterialPageRoute(
          settings: RouteSettings(name: SplashScreen.id),
          builder: (_) => SplashScreen(),
        );
      case LoginScreen.id:
        return MaterialPageRoute(
          settings: RouteSettings(name: LoginScreen.id),
          builder: (_) => LoginScreen(),
        );
      case IntroScreen.id:
        return MaterialPageRoute(
          settings: RouteSettings(name: IntroScreen.id),
          builder: (_) => IntroScreen(),
        );
      case HomeScreen.id:
        return MaterialPageRoute(
          settings: RouteSettings(name: HomeScreen.id),
          builder: (_) => BlocProvider.value(
            child: HomeScreen(),
            value: getIt<HomeBloc>(),
          ),
        );
        case RegisterScreen.id:
        return MaterialPageRoute(
          settings: RouteSettings(name: RegisterScreen.id),
          builder: (_) => RegisterScreen(),
        );
        case EnterLocationScreen.id:
        return MaterialPageRoute(
          settings: RouteSettings(name: EnterLocationScreen.id),
          builder: (_) => EnterLocationScreen(),
        );
        case EnterHealthRecordScreen.id:
        return MaterialPageRoute(
          settings: RouteSettings(name: EnterHealthRecordScreen.id),
          builder: (_) => EnterHealthRecordScreen(),
        );
        case ForgotPasswordScreen.id:
        return MaterialPageRoute(
          settings: RouteSettings(name: ForgotPasswordScreen.id),
          builder: (_) => ForgotPasswordScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
