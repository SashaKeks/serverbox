import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:serverbox/src/presentation/widget/circle_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MENU',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(
              // color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Image with animation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        CircleButton(
                          pIcon: Icons.search,
                          pBgColor: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Find',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        CircleButton(
                          pIcon: Icons.add,
                          pBgColor: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Create',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              CircleButton(
                pIcon: Icons.info_outline,
                pBgColor: Colors.white,
              ),
              CircleButton(
                pIcon: Icons.share_outlined,
                pBgColor: Colors.white,
              ),
              CircleButton(
                pIcon: Icons.settings_outlined,
                pBgColor: Colors.white,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'Resently used',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                    title: const Text(
                      'Name',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      "when",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {},
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        index: 0,
        items: const [
          Icon(
            Icons.home_outlined,
          ),
          Icon(
            Icons.list_alt_outlined,
          ),
          Icon(
            Icons.supervisor_account_sharp,
          ),
        ],
        onTap: (index) {},
      ),
    );
  }
}
