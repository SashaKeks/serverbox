import 'package:flutter/material.dart';

Future enterName(BuildContext context,
    {void Function(String)? onChanged, required void Function()? onPressed}) {
  return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('ENTER NAME'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: onChanged,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  onPressed: onPressed ?? () {},
                  child: const Text(
                    "Create",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        );
      });
}
