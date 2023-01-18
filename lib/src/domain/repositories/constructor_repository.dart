import 'package:serverbox/src/core/resources/data_state.dart';
import 'package:serverbox/src/data/local/constructor_local_datasource.dart';
import 'package:serverbox/src/domain/entities/network_equipment.dart';

class ConstructorRepository {
  final constructorDatasource = ConstructorLocalDataSource();

  Future<DataState> getAllNetworkEquipmentFromConstructor() async {
    try {
      final data =
          await constructorDatasource.getAllNetworkEquipmentFromConstructor();
      return DataSuccess<List<NetworkEquipment>>(data);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future<void> addNetworkEquipmentInConstructor(
      NetworkEquipment networkEquipment) async {
    constructorDatasource.addNetworkEquipmentinConstructor(networkEquipment);
  }
  // Future<DataState<List<NetworkEquipment>>> getAllPortEtalons(){};

  // Future<DataState<NetworkEquipment>> getNetworkEquipmentEtalonById(
  //     {required int networkEquipmentEtalonId}){};

  // Future<DataState<String>> deleteNetworkEquipmentEtalonById(
  //     {required int networkEquipmentEtalonId});

  // Future<DataState<String>> updateOldNetworkEquipmentEtalon(
  //     {required int networkEquipmentEtalonId,
  //     required NetworkEquipment newNetworkEquipmentEtalon});

  // Future<DataState<String>> createNewNetworkEquipmentEtalon(
  //     {required NetworkEquipment newNetworkEquipmentEtalon});
}
