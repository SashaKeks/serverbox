import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoaderState {
  final bool isauthir;

  LoaderState({required this.isauthir});
}

class LoaderCubit extends Cubit<LoaderState> {
  BuildContext context;
  LoaderCubit(this.context) : super(LoaderState(isauthir: true)) {
    authorisationCheck();
  }

  Future<void> authorisationCheck() async {}
}
