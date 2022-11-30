import 'ports.dart';

class NetworkEquipment {
  final int id;
  final String name;
  final String type;
  final String description;
  final List<Ports> ports;

  NetworkEquipment(
      {required this.id,
      required this.name,
      required this.type,
      this.description = '',
      required this.ports});
}
