import 'package:flutter/material.dart';
import 'package:try_amazon_app/common/widget/bottom_bar.dart';
import 'package:try_amazon_app/features/auth/screens/auth_screen.dart';

import 'features/home/screens/home_screen.dart';

// this is dynamic page navigation systems. it's call from main.dart
Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    // move main to auth screen
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    // move to home screen
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    default:
      // there is no page, then showing this
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text(
              'Screen does not exists!',
            ),
          ),
        ),
      );
  }
}
