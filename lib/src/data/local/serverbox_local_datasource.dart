import 'package:serverbox/src/core/constants.dart';
import 'package:serverbox/src/data/local/sql_manager.dart';
import 'package:serverbox/src/domain/entities/server_box.dart';

class ServerBoxSQLDataSource {
  final databaseManager = SqlManager();

  Future<List<ServerBox>> getAllServerBoxes() async {
    final database = await databaseManager.getDB();
    List<Map<String, dynamic>> serverboxes = await database.query(
      AppConstans.serverboxesTable,
    );
    database.close();
    return serverboxes.map((e) => ServerBox.fromMap(e)).toList();
  }

  Future<void> addServerBox({required ServerBox serverbox}) async {
    final database = await databaseManager.getDB();
    await database.insert(
      AppConstans.serverboxesTable,
      serverbox.toMap(),
    );
    database.close();
  }

  Future<void> deleteServerBoxById({required int serverBoxId}) async {
    final database = await databaseManager.getDB();
    await database.delete(
      AppConstans.serverboxesTable,
      where: 'id = ?',
      whereArgs: [serverBoxId],
    );
    database.close();
  }

  Future<void> changeServerboxName({required ServerBox newServerBox}) async {
    final database = await databaseManager.getDB();
    await database.update(
      AppConstans.serverboxesTable,
      newServerBox.toMap(),
      where: 'id = ?',
      whereArgs: [newServerBox.id],
    );
    database.close();
  }
}
