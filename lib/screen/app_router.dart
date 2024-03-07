import 'package:coffee_shop/screen/detail/detail_screen.dart';
import 'package:coffee_shop/screen/home/home_screen.dart';
import 'package:coffee_shop/screen/splash/splash_screen.dart';
import 'package:coffee_shop/utils/router/route_name.dart';
import 'package:flutter/material.dart';

import 'cart/cart_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return navigate(const SplashScreen());
      case RouteName.home:
        return navigate(const HomeScreen());
      case RouteName.cart:
        return navigate(const CartScreen());
      case RouteName.detail:
       {
         List<dynamic> items = settings.arguments as List;
         return navigate(DetailScreen(items: items),);
       }

      default:
        return navigate(const Scaffold());
    }
    
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
