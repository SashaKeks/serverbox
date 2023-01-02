import 'network_equipment.dart';

class ServerBox {
  final int id;
  final String name;
  final List<NetworkEquipment>? networkEquipment;

  ServerBox({
    required this.id,
    required this.name,
    this.networkEquipment,
  });

  ServerBox copyWith({
    int? id,
    String? name,
    List<NetworkEquipment>? networkEquipment,
  }) {
    return ServerBox(
      id: id ?? this.id,
      name: name ?? this.name,
      networkEquipment: networkEquipment ?? this.networkEquipment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory ServerBox.fromMap(Map<String, dynamic> map) {
    return ServerBox(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
}
