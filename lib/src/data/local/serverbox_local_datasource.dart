import 'package:serverbox/src/core/constants.dart';
import 'package:serverbox/src/data/local/sql_manager.dart';
import 'package:serverbox/src/domain/entities/server_box.dart';

class ServerBoxSQLDataSource {
  final databaseManager = SqlManager();
  ServerBoxSQLDataSource() {
    _initServerbox();
  }
  Future<void> _initServerbox() async {
    final database = await databaseManager.initDB();
    final isexist = await database.rawQuery(
        'SELECT name FROM sqlite_master WHERE type=? AND name=?',
        ['table', AppConstans.serverboxesTable]);
    if (isexist.isEmpty) {
      database.execute(
          'CREATE TABLE ${AppConstans.serverboxesTable} (id INTEGER PRIMARY KEY, name TEXT)');
    }
    database.close();
  }

  Future<List<ServerBox>> getAllServerBoxes() async {
    final database = await databaseManager.initDB();
    List<Map<String, dynamic>> maps =
        await database.query(AppConstans.serverboxesTable);
    database.close();
    return maps.map((e) => ServerBox.fromMap(e)).toList();
  }

  Future<void> addServerBox({required ServerBox serverbox}) async {
    final database = await databaseManager.initDB();
    await database.insert(AppConstans.serverboxesTable, serverbox.toMap());
    database.close();
  }

  Future<void> deleteServerBoxById({required int serverBoxId}) async {
    final database = await databaseManager.initDB();
    await database.delete(AppConstans.serverboxesTable,
        where: 'id = ?', whereArgs: [serverBoxId]);
    database.close();
  }

  Future<void> editServerboxName({required ServerBox newServerBox}) async {
    final database = await databaseManager.initDB();
    await database.update(AppConstans.serverboxesTable, newServerBox.toMap(),
        where: 'id = ?', whereArgs: [newServerBox.id]);
    database.close();
  }
}
