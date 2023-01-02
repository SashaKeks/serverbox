import 'package:serverbox/src/core/resources/data_state.dart';
import 'package:serverbox/src/data/local/serverbox_local_datasource.dart';
import 'package:serverbox/src/domain/entities/network_equipment.dart';
import 'package:serverbox/src/domain/entities/server_box.dart';

class ServerBoxRepository {
  final serverboxDatasource = ServerBoxSQLDataSource();
  Future<DataState> getAllServerBox() async {
    try {
      final data = await serverboxDatasource.getAllServerBoxes();
      return DataSuccess<List<ServerBox>>(data);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  void addServerBox({required ServerBox serverBox}) {
    serverboxDatasource.addServerBox(serverbox: serverBox);
  }
  // Future<DataState<ServerBox>> getServerBoxById({required int serverBoxId}) {}

  void deleteServerBoxById({required int serverBoxId}) {
    serverboxDatasource.deleteServerBoxById(serverBoxId: serverBoxId);
  }

  void editServerboxName({required ServerBox newServerBox}) {
    serverboxDatasource.editServerboxName(newServerBox: newServerBox);
  }

  // Future<DataState<ServerBox>> addNetworkEquipmentInServerBox(
  //     {required int serverBoxId, required NetworkEquipment networkEquipment}) {}
}
