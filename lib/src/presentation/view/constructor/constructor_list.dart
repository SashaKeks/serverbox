import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:serverbox/src/presentation/bloc/constructor/constructor_list_cubit.dart';

class ConstructorListScreen extends StatelessWidget {
  const ConstructorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ConstructorListCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Constructor List',
        ),
      ),
      body: ListView.builder(
        itemCount: state.netEquipment.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Slidable(
              key: ValueKey(index),
              startActionPane: ActionPane(
                motion: const BehindMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: const Color.fromARGB(255, 153, 9, 9),
                    foregroundColor: Colors.white,
                    icon: Icons.delete_outline,
                    label: 'Delete',
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: const BehindMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) {},
                    backgroundColor: const Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.edit_outlined,
                    label: 'Edit',
                  ),
                ],
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
                title: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Some',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onTap: () {},
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
