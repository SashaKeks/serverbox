// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'ports.dart';

class NetworkEquipment {
  final int id;
  final String name;
  final String type;
  final String description;
  final List<Ports> ports;

  NetworkEquipment({
    required this.id,
    required this.name,
    required this.type,
    this.description = '',
    required this.ports,
  });

  NetworkEquipment copyWith({
    int? id,
    String? name,
    String? type,
    String? description,
    List<Ports>? ports,
  }) {
    return NetworkEquipment(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      ports: ports ?? this.ports,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'description': description,
      'ports': ports.map((x) => x.toMap()).toList(),
    };
  }

  factory NetworkEquipment.fromMap(Map<String, dynamic> map) {
    return NetworkEquipment(
      id: map['id'] as int,
      name: map['name'] as String,
      type: map['type'] as String,
      description: map['description'] as String,
      ports: List<Ports>.from(
        (map['ports'] as List<int>).map<Ports>(
          (x) => Ports.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
  @override
  bool operator ==(covariant NetworkEquipment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.type == type &&
        other.description == description &&
        listEquals(other.ports, ports);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        type.hashCode ^
        description.hashCode ^
        ports.hashCode;
  }
}
