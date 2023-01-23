import 'package:serverbox/src/domain/entities/server_box.dart';

/// Datasource Interface
abstract class ServerBoxDatasourceInterface {
  /// get all serverboxes from database
  Future<List<ServerBox>> getAllServerBoxes();

  ///get one serverbox from database using id
  Future<ServerBox> getServerBoxById({required int serverBoxId});

  /// add one serverbox to database
  Future<void> addServerBox({required ServerBox serverbox});

  Future<void> deleteServerBoxById({required int serverBoxId});

  Future<void> updateServerBox({required ServerBox newServerBox});
}
