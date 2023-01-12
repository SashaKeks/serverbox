import 'package:flutter/material.dart';

class AddToConstructor extends StatelessWidget {
  const AddToConstructor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            onTap: () => Navigator.pop(
              context,
            ),
            title: Text('$index'),
          ),
        ));
  }
}
