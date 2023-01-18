import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serverbox/src/presentation/bloc/constructor/constructor_list_cubit.dart';
import 'package:serverbox/src/presentation/bloc/constructor/constructotr_cubit.dart';
import 'package:serverbox/src/presentation/bloc/menu_bloc/menu_cubit.dart';
import 'package:serverbox/src/presentation/bloc/serverbox_bloc/serverbox_cubit.dart';
import 'package:serverbox/src/presentation/bloc/serverbox_list_bloc/serverbox_list_cubit.dart';
import 'package:serverbox/src/presentation/view/constructor/constructor_list.dart';
import 'package:serverbox/src/presentation/view/constructor/na_constructor.dart';
import 'package:serverbox/src/presentation/view/menu/menu_screen.dart';
import 'package:serverbox/src/presentation/view/serverbox/serverbox_screen.dart';

class ScreenFactory {
  static Widget createNaConstructor() {
    return BlocProvider(
      create: (context) => ConstructorCubit(),
      child: const NAConstructor(),
    );
  }

  static Widget createConstructorList() {
    return BlocProvider(
      create: (context) => ConstructorListCubit(),
      child: const ConstructorListScreen(),
    );
  }

  static Widget createServerBox({required int serverboxId}) {
    return BlocProvider(
      create: (context) => ServerBoxCubit(serverboxId: serverboxId),
      child: Builder(
        builder: (context) => const ServerBoxScreen(),
      ),
    );
  }

  static Widget createMenu() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MenuScreenCubit()),
        BlocProvider(create: (context) => ServerboxListCubit()),
      ],
      child: const MenuScreen(),
    );
  }
}
