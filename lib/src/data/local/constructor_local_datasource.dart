import 'package:serverbox/src/core/constants.dart';
import 'package:serverbox/src/data/local/sql_manager.dart';
import 'package:serverbox/src/domain/entities/network_equipment.dart';

class ConstructorLocalDataSource {
  final _databaseManager = SqlManager();

  Future<List<NetworkEquipment>> getAllNetworkEquipmentFromConstructor() async {
    final database = await _databaseManager.getDB();
    final List<Map<String, dynamic>> networkEquipment = await database.query(
      AppConstans.constructorTable,
    );
    await database.close();

    return networkEquipment
        .map((element) => NetworkEquipment.fromMap(element))
        .toList();
  }

  Future<void> addNetworkEquipmentinConstructor(
      NetworkEquipment networkEquipment) async {
    final database = await _databaseManager.getDB();
    await database.insert(
      AppConstans.constructorTable,
      networkEquipment.toMap(),
    );
    await database.close();
  }
}
