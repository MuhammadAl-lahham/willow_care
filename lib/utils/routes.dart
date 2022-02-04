import 'package:flutter/material.dart';
import 'package:willow_care_test/ui/main_page/main_page.dart';
import 'package:willow_care_test/ui/payment/payment_page.dart';
import 'package:willow_care_test/ui/welcome_page/welcome_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case WelcomePage.route:
        return MaterialPageRoute(builder: (_) => const WelcomePage());

      case MainPage.route:
        return MaterialPageRoute(builder: (_) => const MainPage());

      case PaymentPage.route:
        return MaterialPageRoute(builder: (_) => const PaymentPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
