import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serverbox/src/presentation/bloc/menu_bloc/menu_cubit.dart';
import 'package:serverbox/src/presentation/view/serverbox_list/serverbox_list_screen.dart';
import 'package:serverbox/src/presentation/widget/square_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controlPage = PageController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MENU',
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          context.read<MenuScreenCubit>().changePage(index);
        },
        controller: controlPage,
        children: [
          const HomeScreen(),
          const ServerBoxListScreen(),
          Center(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.cyan,
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        height: 70,
        index: context.watch<MenuScreenCubit>().state.currentPage,
        items: const [
          Icon(
            Icons.home_outlined,
          ),
          Icon(
            Icons.settings_outlined,
          ),
          Icon(
            Icons.info_outline,
          ),
        ],
        onTap: (index) {
          context.read<MenuScreenCubit>().changePage(index);
          controlPage.jumpToPage(index);
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Wrap(
            runSpacing: 10.0,
            spacing: 10.0,
            direction: Axis.vertical,
            children: [
              SquareButton(
                width: 200,
                height: 300,
                pIcon: Icons.list_alt_outlined,
                pBgColor: Colors.white,
                onTap: () {},
              ),
              SquareButton(
                width: 200,
                height: 190,
                pIcon: Icons.create_new_folder_outlined,
                pBgColor: Colors.white,
                onTap: () {},
              ),
              SquareButton(
                width: 200,
                pIcon: Icons.share,
                pBgColor: Colors.white,
                onTap: () {},
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white,
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            top: 30.0,
            bottom: 20.0,
          ),
          child: Text(
            'Resently used',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: ListView.builder(
              itemCount: 3,
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
    );
  }
}
