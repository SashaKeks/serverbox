import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:serverbox/src/config/navigation/navigation_names.dart';
import 'package:serverbox/src/presentation/bloc/serverbox_list_bloc/serverbox_list_cubit.dart';
import 'package:serverbox/src/presentation/widget/showDialog.dart';

class ServerBoxListScreen extends StatelessWidget {
  const ServerBoxListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Server List"),
      ),
      body: BlocBuilder<ServerboxListCubit, ServerboxListState>(
        builder: (context, state) => ListView.builder(
            itemCount: state.serverboxList.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slidable(
                    key: const ValueKey(0),
                    startActionPane: ActionPane(
                      motion: const BehindMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => context
                              .read<ServerboxListCubit>()
                              .deleteServerBox(
                                  serverBoxId: state.serverboxList[index].id),
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
                          onPressed: (_) async {
                            await enterName(
                              context,
                              onChanged: context
                                  .read<ServerboxListCubit>()
                                  .getNameForNewServerbox,
                              onPressed: () {
                                context
                                    .read<ServerboxListCubit>()
                                    .editServerboxName(
                                        serverBoxId:
                                            state.serverboxList[index].id);
                                Navigator.pop(context);
                              },
                            );
                          },
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
                          state.serverboxList[index].name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () => Navigator.pushNamed(
                        context,
                        NavigationNames.serverbox,
                        arguments: state.serverboxList[index].id,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          await enterName(
            context,
            onChanged:
                context.read<ServerboxListCubit>().getNameForNewServerbox,
            onPressed: () {
              context.read<ServerboxListCubit>().addServerBox();
              Navigator.pop(context);
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 40,
        ),
      ),
    );
  }
}
