import 'package:flutter/material.dart';
import 'package:serverbox/src/config/navigation/navigation_names.dart';
import 'package:serverbox/src/config/screen_factory/screen_factory.dart';
import 'package:serverbox/src/presentation/view/constructor/add_to_constructor.dart';
import 'package:serverbox/src/presentation/view/constructor/constructor_list.dart';
import 'package:serverbox/src/presentation/view/authorisation/login_screen.dart';
import 'package:serverbox/src/presentation/view/registration/registration_screen.dart';

class MainNavigation {
  static Map<String, WidgetBuilder> routes = {
    // NavigationNames.loginScreenName: (context) => const LoginScreen(),
    // NavigationNames.registartionScreenName: (context) =>
    //     const RegistrationScreen(),
    NavigationNames.constructorList: (context) =>
        ScreenFactory.createConstructorList(),
    NavigationNames.addToConstructor: (context) => const AddToConstructor(),
    NavigationNames.constructorNA: (context) =>
        ScreenFactory.createNaConstructor(),
    NavigationNames.menuScreenName: (context) => ScreenFactory.createMenu(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings setttings) {
    switch (setttings.name) {
      case NavigationNames.serverbox:
        final serverboxId = setttings.arguments as int;
        return MaterialPageRoute(
            builder: (context) =>
                ScreenFactory.createServerBox(serverboxId: serverboxId));
    }
    return null;
  }
}
