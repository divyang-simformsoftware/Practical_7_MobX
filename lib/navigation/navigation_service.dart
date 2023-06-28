import 'package:bitcoin_app/pages/dashboard_page.dart';
import 'package:bitcoin_app/pages/login_screen.dart';
import 'package:bitcoin_app/store/bitcoin_store.dart';
import 'package:bitcoin_app/store/bottomnav_store.dart';
import 'package:bitcoin_app/store/login_store.dart';
import 'package:bitcoin_app/store/password_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationService {
  Route<MaterialPageRoute> generatedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MultiProvider(
            providers: [
              Provider(create: (context) => LoginStore()),
              Provider(create: (context) => PasswordStore()),
            ],
            child: const LoginPage(),
          ),
        );
      case '/dashboardPage':
        return MaterialPageRoute(
          builder: (_) => MultiProvider(
            providers: [
              Provider(create: (context) => BitcoinStore()),
              Provider(create: (context) => BottomNavStore()),
            ],
            child: const DashboardPage(),
          ),
        );
      default:
        return NavigationService().errorRoute();
    }
  }

  Route<MaterialPageRoute> errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Page Not Found'),
          ),
        );
      },
    );
  }
}
