// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  Ports copyWith({
    int? id,
    int? currentNetworkEquipmentId,
    String? description,
    int? destinationPortId,
    PortType? type,
    double? x,
    double? y,
  }) {
    return Ports(
      id: id ?? this.id,
      currentNetworkEquipmentId:
          currentNetworkEquipmentId ?? this.currentNetworkEquipmentId,
      description: description ?? this.description,
      destinationPortId: destinationPortId ?? this.destinationPortId,
      type: type ?? this.type,
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'currentNetworkEquipmentId': currentNetworkEquipmentId,
      'description': description,
      'destinationPortId': destinationPortId,
      'type': type.toString(),
      'x': x,
      'y': y,
    };
  }

  factory Ports.fromMap(Map<String, dynamic> map) {
    return Ports(
      id: map['id'] as int,
      currentNetworkEquipmentId: map['currentNetworkEquipmentId'] as int,
      description: map['description'] as String,
      destinationPortId: map['destinationPortId'] as int,
      type: map['type'] as PortType,
      x: map['x'] != null ? map['x'] as double : null,
      y: map['y'] != null ? map['y'] as double : null,
    );
  }

  @override
  bool operator ==(covariant Ports other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.currentNetworkEquipmentId == currentNetworkEquipmentId &&
        other.description == description &&
        other.destinationPortId == destinationPortId &&
        other.type == type &&
        other.x == x &&
        other.y == y;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        currentNetworkEquipmentId.hashCode ^
        description.hashCode ^
        destinationPortId.hashCode ^
        type.hashCode ^
        x.hashCode ^
        y.hashCode;
  }
}
