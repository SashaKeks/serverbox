// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serverbox/src/domain/entities/network_equipment.dart';
import 'package:serverbox/src/domain/repositories/constructor_repository.dart';

class ConstructorListState {
  List<NetworkEquipment> netEquipment;
  ConstructorListState({
    required this.netEquipment,
  });

  ConstructorListState copyWith({
    List<NetworkEquipment>? netEquipment,
  }) {
    return ConstructorListState(
      netEquipment: netEquipment ?? this.netEquipment,
    );
  }
}

class ConstructorListCubit extends Cubit<ConstructorListState> {
  final constructorRepository = ConstructorRepository();
  ConstructorListCubit() : super(ConstructorListState(netEquipment: []));

  // Future<void> getAllNetworkEquipmentFromConstructor() async {
  //   final netEquipment =
  //       await constructorRepository.getAllNetworkEquipmentFromConstructor();
  //   emit(state.copyWith(netEquipment: netEquipment.data));
  // }

  // Future<void> addNetworkEquipmentInConstructor(
  //     NetworkEquipment networkEquipment) async {
  //   await constructorRepository
  //       .addNetworkEquipmentInConstructor(networkEquipment);
  // }
}
