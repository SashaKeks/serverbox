import 'package:serverbox/src/core/resources/data_state.dart';
import 'package:serverbox/src/domain/entities/network_equipment.dart';

abstract class ConstructorRepository {
  Future<DataState<List<NetworkEquipment>>> getAllNetworkEquipmentEtalons();

  Future<DataState<List<NetworkEquipment>>> getAllPortEtalons();

  Future<DataState<NetworkEquipment>> getNetworkEquipmentEtalonById(
      {required int networkEquipmentEtalonId});

  Future<DataState<String>> deleteNetworkEquipmentEtalonById(
      {required int networkEquipmentEtalonId});

  Future<DataState<String>> updateOldNetworkEquipmentEtalon(
      {required int networkEquipmentEtalonId,
      required NetworkEquipment newNetworkEquipmentEtalon});

  Future<DataState<String>> createNewNetworkEquipmentEtalon(
      {required NetworkEquipment newNetworkEquipmentEtalon});
}
