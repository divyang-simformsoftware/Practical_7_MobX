import 'package:bitcoin_app/utils/export.dart';

final themeStore = ThemeToggle();
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          title: 'Bitcoin Demo App',
          debugShowCheckedModeBanner: false,
          darkTheme: themeStore.themeToggle
              ? ThemeData.dark(useMaterial3: true)
              : ThemeData.light(useMaterial3: true),
          themeMode: ThemeMode.dark,
          initialRoute: '/',
          onGenerateRoute: NavigationService().generatedRoutes,
        );
      },
    );
  }
}
