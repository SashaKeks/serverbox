import 'package:sqflite/sqflite.dart';

abstract class SourceManager {
  Future<Database> getDB();

  Future<bool> _isExistTableInDB(String tableName);

  Future<void> _initServerboxTable();

  Future<void> _initConstructorTable();
}
