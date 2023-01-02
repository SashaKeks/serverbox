import 'package:flutter_bloc/flutter_bloc.dart';

class ServerBoxState {}

class ServerBoxCubit extends Cubit<ServerBoxState> {
  final int serverboxId;
  ServerBoxCubit({required this.serverboxId}) : super(ServerBoxState());
}
