import 'package:serverbox/src/core/resources/data_state.dart';
import 'package:serverbox/src/domain/entities/network_equipment.dart';

abstract class NetworkEquipmentRepository {
  Future<DataState<String>> updateNetworkEquipmentById(
      {required int networkEquipmentId, NetworkEquipment newNetworkEquipment});
}
