import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login in ..."),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 40.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
