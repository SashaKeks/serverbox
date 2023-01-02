import 'package:flutter/material.dart';
import 'package:serverbox/src/core/loader_indicators/fanding_circles.dart';

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 200.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Please, wait",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Column(
              children: [
                SpinKitFadingCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 205, 86, 0),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    );
                  },
                  size: 80,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Connecting",
                  style: TextStyle(
                      color: Color.fromARGB(255, 205, 86, 0), fontSize: 25.0),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
