import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serverbox/src/presentation/bloc/serverbox_bloc/serverbox_cubit.dart';

class ServerBoxScreen extends StatelessWidget {
  const ServerBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = context.read<ServerBoxCubit>().toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: const Text("123"),
    );
  }
}
