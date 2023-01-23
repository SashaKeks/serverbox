import 'package:path/path.dart';
import 'package:serverbox/src/core/constants.dart';
import 'package:sqflite/sqflite.dart';

class SqlManager {
  SqlManager() {
    _initServerboxTable();
    _initConstructorTable();
  }
  Future<Database> getDB() async {
    final databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, AppConstans.dbName);

    return openDatabase(path, version: 1);
  }

  Future<bool> _isExist(String tableName) async {
    final database = await getDB();
    final tables = await database.rawQuery(
      'SELECT name FROM sqlite_master WHERE type=? AND name=?',
      ['table', tableName],
    );
    await database.close();

    return tables.isNotEmpty;
  }

  Future<void> _initServerboxTable() async {
    final isTableExist = await _isExist(AppConstans.serverboxesTable);
    final database = await getDB();
    if (!isTableExist) {
      await database.execute(
        '''CREATE TABLE ${AppConstans.serverboxesTable} (id INTEGER PRIMARY KEY, name TEXT)''',
      );
    }
    await database.close();
  }

  Future<void> _initConstructorTable() async {
    final isTableExist = await _isExist(AppConstans.constructorTable);
    final database = await getDB();
    if (!isTableExist) {
      await database.execute(
        '''CREATE TABLE ${AppConstans.constructorTable} (id INTEGER PRIMARY KEY, name TEXT, type TEXT)''',
      );
    }
    await database.close();
  }
}
