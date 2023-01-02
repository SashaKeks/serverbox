import 'package:path/path.dart';
import 'package:serverbox/src/core/constants.dart';
import 'package:sqflite/sqflite.dart';

class SqlManager {
  Future<Database> initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, AppConstans.dbName);
    return openDatabase(path, version: 1);
  }
}
