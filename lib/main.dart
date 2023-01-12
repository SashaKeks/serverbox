import 'package:flutter/material.dart';
import 'package:serverbox/src/config/navigation/main_navigation.dart';
import 'package:serverbox/src/config/navigation/navigation_names.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.black),
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: NavigationNames.menuScreenName,
      routes: MainNavigation.routes,
      onGenerateRoute: MainNavigation.onGenerateRoute,
    );
  }
}
