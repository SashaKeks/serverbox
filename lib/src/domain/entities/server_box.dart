// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'network_equipment.dart';

class ServerBox {
  final int id;
  final String name;
  final List<NetworkEquipment> networkEquipment;

  ServerBox(this.id, this.name, this.networkEquipment);
}
