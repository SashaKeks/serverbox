import 'package:serverbox/src/core/resources/data_state.dart';
import 'package:serverbox/src/domain/entities/network_equipment.dart';
import 'package:serverbox/src/domain/entities/server_box.dart';

abstract class ServerBoxRepository {
  Future<DataState<List<ServerBox>>> getAllServerBox();

  Future<DataState<ServerBox>> getServerBoxById({required int serverBoxId});

  Future<DataState<ServerBox>> deleteServerBoxById({required int serverBoxId});

  Future<DataState<ServerBox>> updateServerBoxById({required int serverBoxId});

  Future<DataState<ServerBox>> addNetworkEquipmentInServerBox(
      {required int serverBoxId, required NetworkEquipment networkEquipment});
}
