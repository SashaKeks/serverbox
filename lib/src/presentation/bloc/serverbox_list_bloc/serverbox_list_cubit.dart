// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:serverbox/src/domain/entities/server_box.dart';
import 'package:serverbox/src/domain/repositories/serverbox_repository.dart';

class ServerboxListState {
  List<ServerBox> serverboxList = [];
  String newServerBoxName = '';
  ServerboxListState({
    serverboxList,
    newServerBoxName,
  }) {
    this.serverboxList = serverboxList ?? [];
    this.newServerBoxName = newServerBoxName ?? '';
  }

  ServerboxListState copyWith({
    List<ServerBox>? serverboxList,
    String? newServerBoxName,
  }) {
    return ServerboxListState(
      serverboxList: serverboxList ?? this.serverboxList,
      newServerBoxName: newServerBoxName ?? this.newServerBoxName,
    );
  }
}

class ServerboxListCubit extends Cubit<ServerboxListState> {
  final serverboxRepository = ServerBoxRepository();
  ServerboxListCubit() : super(ServerboxListState()) {
    initList();
  }
  Future<void> initList() async {
    final data = await serverboxRepository.getAllServerBox();
    emit(state.copyWith(serverboxList: data.data));
  }

  void addServerBox() {
    if (state.newServerBoxName != '') {
      serverboxRepository.addServerBox(
        serverBox: ServerBox(
          id: state.serverboxList.isEmpty
              ? 1
              : state.serverboxList[state.serverboxList.length - 1].id + 1,
          name: state.newServerBoxName,
        ),
      );
    }
    emit(state.copyWith(newServerBoxName: ''));
    initList();
  }

  void getNameForNewServerbox(String name) {
    emit(state.copyWith(newServerBoxName: name));
  }

  void editServerboxName({required int serverBoxId}) {
    for (var element in state.serverboxList) {
      if (element.id == serverBoxId && state.newServerBoxName != '') {
        serverboxRepository.editServerboxName(
            newServerBox: element.copyWith(name: state.newServerBoxName));
      }
    }
    emit(state.copyWith(newServerBoxName: ''));
    initList();
  }

  void deleteServerBox({required int serverBoxId}) {
    serverboxRepository.deleteServerBoxById(serverBoxId: serverBoxId);
    initList();
  }
}
