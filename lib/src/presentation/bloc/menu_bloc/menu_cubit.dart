import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuScreenState {
  int currentPage = 0;
  MenuScreenState({
    required this.currentPage,
  });

  MenuScreenState copyWith({
    int? currentPage,
  }) {
    return MenuScreenState(
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

class MenuScreenCubit extends Cubit<MenuScreenState> {
  MenuScreenCubit() : super(MenuScreenState(currentPage: 0));

  void changePage(int indexPage) {
    emit(state.copyWith(currentPage: indexPage));
  }
}
