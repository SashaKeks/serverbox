// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'network_equipment.dart';

class ServerBox {
  final int id;
  final String name;
  final List<NetworkEquipment> networkEquipment;

  ServerBox(
    this.id,
    this.name,
    this.networkEquipment,
  );

  ServerBox copyWith({
    int? id,
    String? name,
    List<NetworkEquipment>? networkEquipment,
  }) {
    return ServerBox(
      id ?? this.id,
      name ?? this.name,
      networkEquipment ?? this.networkEquipment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'networkEquipment': networkEquipment.map((x) => x.toMap()).toList(),
    };
  }

  factory ServerBox.fromMap(Map<String, dynamic> map) {
    return ServerBox(
      map['id'] as int,
      map['name'] as String,
      List<NetworkEquipment>.from(
        (map['networkEquipment'] as List<int>).map<NetworkEquipment>(
          (x) => NetworkEquipment.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
  @override
  bool operator ==(covariant ServerBox other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.networkEquipment, networkEquipment);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ networkEquipment.hashCode;
}
