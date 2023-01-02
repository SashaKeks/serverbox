import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serverbox/src/config/navigation/navigation_names.dart';
import 'package:serverbox/src/presentation/bloc/serverbox_bloc/serverbox_cubit.dart';
import 'package:serverbox/src/presentation/bloc/serverbox_list_bloc/serverbox_list_cubit.dart';
import 'package:serverbox/src/presentation/view/constructor/NA_constructor.dart';
import 'package:serverbox/src/presentation/view/constructor/add_to_constructor.dart';
import 'package:serverbox/src/presentation/view/main_app_pages/loader_screen.dart';
import 'package:serverbox/src/presentation/view/main_app_pages/login_screen.dart';
import 'package:serverbox/src/presentation/view/main_app_pages/menu_screen.dart';
import 'package:serverbox/src/presentation/view/main_app_pages/registration_screen.dart';
import 'package:serverbox/src/presentation/view/serverbox/serverbox_list_screen.dart';
import 'package:serverbox/src/presentation/view/serverbox/serverbox_screen.dart';

class MainNavigation {
  static Map<String, WidgetBuilder> routes = {
    NavigationNames.loaderScreenName: (context) => const LoaderScreen(),
    NavigationNames.menuScreenName: (context) => const MenuScreen(),
    NavigationNames.loginScreenName: (context) => const LoginScreen(),
    NavigationNames.registartionScreenName: (context) =>
        const RegistrationScreen(),
    NavigationNames.constructor: (context) => const NAConstructor(),
    NavigationNames.addToConstructor: (context) => const AddToConstructor(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings setttings) {
    switch (setttings.name) {
      case NavigationNames.serverboxList:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ServerboxListCubit>(
            create: (_) => ServerboxListCubit(),
            child: const ServerBoxListScreen(),
          ),
        );
      case NavigationNames.serverbox:
        final serverboxId = setttings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ServerBoxCubit>(
            create: (context) => ServerBoxCubit(serverboxId: serverboxId),
            lazy: false,
            child: Builder(
              builder: (context) => const ServerBoxScreen(),
            ),
          ),
        );
    }
  }
}
