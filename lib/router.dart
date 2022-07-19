import 'package:flutter/material.dart';
import 'package:try_amazon_app/common/widget/bottom_bar.dart';
import 'package:try_amazon_app/features/admin/screens/add_product_screen.dart';
import 'package:try_amazon_app/features/auth/screens/auth_screen.dart';
import 'package:try_amazon_app/features/home/screens/category_deals_screen.dart';
import 'package:try_amazon_app/features/product_details/screens/product_details_screen.dart';
import 'package:try_amazon_app/features/search/screens/search_screen.dart';
import 'package:try_amazon_app/model/product.dart';

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
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(category: category),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDetailsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailsScreen(product: product),
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
