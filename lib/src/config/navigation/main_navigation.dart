import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serverbox/src/config/navigation/navigation_names.dart';
import 'package:serverbox/src/presentation/bloc/menu_bloc/menu_cubit.dart';
import 'package:serverbox/src/presentation/bloc/serverbox_bloc/serverbox_cubit.dart';
import 'package:serverbox/src/presentation/bloc/serverbox_list_bloc/serverbox_list_cubit.dart';
import 'package:serverbox/src/presentation/view/constructor/add_to_constructor/add_to_constructor.dart';
import 'package:serverbox/src/presentation/view/constructor/constructor_na_list/constructor_main.dart';
import 'package:serverbox/src/presentation/view/constructor/create_constructor/na_constructor.dart';
import 'package:serverbox/src/presentation/view/authorisation/login_screen.dart';
import 'package:serverbox/src/presentation/view/menu/menu_screen.dart';
import 'package:serverbox/src/presentation/view/registration/registration_screen.dart';
import 'package:serverbox/src/presentation/view/serverbox_list/serverbox_list_screen.dart';
import 'package:serverbox/src/presentation/view/serverbox/serverbox_screen.dart';

class MainNavigation {
  static Map<String, WidgetBuilder> routes = {
    NavigationNames.loginScreenName: (context) => const LoginScreen(),
    NavigationNames.registartionScreenName: (context) =>
        const RegistrationScreen(),
    NavigationNames.constructor: (context) => const ConstructorMainScreen(),
    NavigationNames.addToConstructor: (context) => const AddToConstructor(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings setttings) {
    switch (setttings.name) {
      // case NavigationNames.serverboxList:
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider<ServerboxListCubit>(
      //       create: (_) => ServerboxListCubit(),
      //       child: const ServerBoxListScreen(),
      //     ),
      //   );
      case NavigationNames.createNewNA:
        return MaterialPageRoute(
          builder: (_) => NAConstructor.create(),
        );

      case NavigationNames.serverbox:
        final serverboxId = setttings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ServerBoxCubit>(
            create: (context) => ServerBoxCubit(serverboxId: serverboxId),
            child: Builder(
              builder: (context) => const ServerBoxScreen(),
            ),
          ),
        );
      case NavigationNames.menuScreenName:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => MenuScreenCubit()),
              BlocProvider(create: (context) => ServerboxListCubit()),
            ],
            child: const MenuScreen(),
          ),
        );
      // case NavigationNames.loaderScreenName:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<LoaderCubit>(
      //       create: (context) => LoaderCubit(context),
      //       lazy: false,
      //       child: const LoaderScreen(),
      //     ),
      //   );
    }
    return null;
  }
}
