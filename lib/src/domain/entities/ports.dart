import 'package:serverbox/src/core/enums/port_type.dart';

class Ports {
  final int id;
  final int currentNetworkEquipmentId;
  final String description;
  final int destinationPortId;
  final PortType type;
  final double? x;
  final double? y;

  Ports({
    required this.id,
    this.currentNetworkEquipmentId = 0,
    this.description = '',
    this.destinationPortId = 0,
    required this.type,
    this.x,
    this.y,
  });
}
