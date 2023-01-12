import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ConstructorMainScreen extends StatelessWidget {
  const ConstructorMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
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
                // shape: Border.all(
                //   color: Colors.white,
                // ),
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
                title: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Some',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
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
    );
  }
}
