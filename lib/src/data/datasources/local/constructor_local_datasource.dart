import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ConstructorLocalDatasource {
  late final Database database;
  ConstructorLocalDatasource() {
    initialDataBade();
  }

  Future<void> initialDataBade() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'serverBox_constructor.db');

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });
  }
}
