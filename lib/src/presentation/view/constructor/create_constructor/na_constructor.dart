import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serverbox/src/presentation/bloc/constructor_bloc/constructotr_cubit.dart';
import 'package:serverbox/src/presentation/widget/background_grid.dart';

class NAConstructor extends StatelessWidget {
  const NAConstructor({super.key});

  static Widget create() {
    return BlocProvider(
      create: (context) => ConstructorCubit(),
      child: const NAConstructor(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: CustomPaint(
        painter: BacgroundPaint(),
        child: OrientationBuilder(
          builder: (context, orientation) => Stack(
            children: [
              NaFront(orientation),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     netEquip.portList
      //         .add(NEPort('TestPort ${netEquip.portList.length}', 0, 0));
      //     // Navigator.of(context).pushNamed('/menu/constructor/add');
      //   },
      //   child: const Icon(Icons.add_box),
      // ),
      // bottomNavigationBar: Container(
      // height: 100,
      // width: double.infinity,
      // color: Colors.green,
      // child: ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemCount: netEquip.portList.length + 6,
      //   itemBuilder: (context, index) {
      //     if (isTapedElement == index) {
      //       return Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: TextButton(
      //           style: ButtonStyle(
      //             backgroundColor: MaterialStatePropertyAll(
      //               Colors.white,
      //             ),
      //           ),
      //           onPressed: () {
      //             isTapedElement = null;
      //             setState(() {});
      //           },
      //           child: Text(
      //             'Some ${index}',
      //             style: TextStyle(fontSize: 20, color: Colors.black),
      //           ),
      //         ),
      //       );
      //     }
      //     return Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: TextButton(
      //         style: ButtonStyle(
      //           backgroundColor: MaterialStatePropertyAll(Colors.black),
      //         ),
      //         onPressed: () {
      //           isTapedElement = index;
      //           setState(() {});
      //         },
      //         child: Text(
      //           'Some ${index}',
      //           style: TextStyle(fontSize: 20, color: Colors.white),
      //         ),
      //       ),
      //     );
      // },
      // ),
      // ),
    );
  }
}

class NaFront extends StatefulWidget {
  final orientation;
  const NaFront(this.orientation, {super.key});

  @override
  State<NaFront> createState() => _NaFrontState();
}

class _NaFrontState extends State<NaFront> {
  double _x = 0;
  double _y = 0;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _x,
      top: _y,
      child: Draggable(
        feedback: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 237, 231, 231),
              width: 4.0,
            ),
          ),
          width: widget.orientation == Orientation.portrait ? 100 : 600,
          height: widget.orientation == Orientation.portrait ? 600 : 100,
          child: Stack(
            children: [],
          ),
        ),
        childWhenDragging: const SizedBox(),
        onDragEnd: (dragDetails) {
          setState(() {
            _x = dragDetails.offset.dx;
            _y = dragDetails.offset.dy - 115.0;
          });
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 252, 247, 247),
                  width: 4.0,
                ),
              ),
              width: widget.orientation == Orientation.portrait ? 100 : 600,
              height: widget.orientation == Orientation.portrait ? 600 : 100,
            ),
          ],
        ),
      ),
    );
  }
}
