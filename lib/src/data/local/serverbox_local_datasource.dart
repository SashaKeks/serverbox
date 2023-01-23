import 'package:serverbox/src/core/constants.dart';
import 'package:serverbox/src/data/datasource_interfaces/serverbox_datasource_interface.dart';
import 'package:serverbox/src/data/local/sql_manager.dart';
import 'package:serverbox/src/domain/entities/server_box.dart';

class ServerBoxLocalDatasource implements ServerBoxDatasourceInterface {
  final SqlManager _databaseManager = SqlManager();

  @override
  Future<List<ServerBox>> getAllServerBoxes() async {
    final database = await _databaseManager.getDB();
    final List<Map<String, dynamic>> serverboxes = await database.query(
      AppConstans.serverboxesTable,
    );
    await database.close();

    return serverboxes.map((e) => ServerBox.fromMap(e)).toList();
  }

  @override
  Future<void> addServerBox({required ServerBox serverbox}) async {
    final database = await _databaseManager.getDB();
    await database.insert(
      AppConstans.serverboxesTable,
      serverbox.toMap(),
    );
    await database.close();
  }

  @override
  Future<void> deleteServerBoxById({required int serverBoxId}) async {
    final database = await _databaseManager.getDB();
    await database.delete(
      AppConstans.serverboxesTable,
      where: 'id = ?',
      whereArgs: [serverBoxId],
    );
    await database.close();
  }

  @override
  Future<void> updateServerBox({required ServerBox newServerBox}) async {
    final database = await _databaseManager.getDB();
    await database.update(
      AppConstans.serverboxesTable,
      newServerBox.toMap(),
      where: 'id = ?',
      whereArgs: [newServerBox.id],
    );
    await database.close();
  }

  @override
  Future<ServerBox> getServerBoxById({required int serverBoxId}) async {
    final database = await _databaseManager.getDB();
    final serverbox = await database.query(
      AppConstans.serverboxesTable,
      where: 'id = ?',
      whereArgs: [serverBoxId],
    );
    await database.close();

    return ServerBox.fromMap(serverbox[0]);
  }
}
