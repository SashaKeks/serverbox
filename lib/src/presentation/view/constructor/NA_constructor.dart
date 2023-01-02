import 'package:flutter/material.dart';

class NAConstructor extends StatefulWidget {
  const NAConstructor({super.key});

  @override
  State<NAConstructor> createState() => _NAConstructorState();
}

class _NAConstructorState extends State<NAConstructor> {
  double _x = 0;
  double _y = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: CustomPaint(
        painter: BacgroundPaint(),
        child: OrientationBuilder(
          builder: (context, orientation) => Stack(
            children: [
              Positioned(
                left: _x,
                top: _y,
                child: Draggable(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 252, 247, 247),
                            width: 4.0,
                          ),
                        ),
                        width: orientation == Orientation.portrait ? 300 : 600,
                        height: orientation == Orientation.portrait ? 50 : 100,
                      ),
                      Positioned(
                        width: 10,
                        height: 10,
                        left: 0,
                        top: 0,
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  feedback: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 237, 231, 231),
                        width: 4.0,
                      ),
                    ),
                    width: orientation == Orientation.portrait ? 300 : 600,
                    height: orientation == Orientation.portrait ? 50 : 100,
                    child: Stack(
                      children: [
                        Positioned(
                          width: 10,
                          height: 10,
                          left: 0,
                          top: 0,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  childWhenDragging: Container(),
                  onDragEnd: (dragDetails) {
                    setState(() {
                      _x = dragDetails.offset.dx < 0
                          ? 0
                          : dragDetails.offset.dx > width - 300
                              ? width - 300
                              : dragDetails.offset.dx;
                      _y = dragDetails.offset.dy - 115.0 < 0
                          ? 0
                          : dragDetails.offset.dy - 115.0 > height - 200
                              ? height - 200
                              : dragDetails.offset.dy - 115.0;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var arg = Navigator.of(context).pushNamed('/menu/constructor/add');
        },
        child: Icon(Icons.add_box),
      ),
    );
  }
}

class BacgroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final double cubeSize = size.width / 10;
    final paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Color.fromARGB(105, 223, 226, 226);

    final heightLine = 10; // your Horizontal line
    final widthLine = 10; // your Vertical line

    for (int i = 1; i < height; i++) {
      if (i % heightLine == 0) {
        Path linePath = Path();
        linePath
            .addRect(Rect.fromLTRB(0, i.toDouble(), width, (i + 2).toDouble()));
        canvas.drawPath(linePath, paint);
      }
    }
    for (int i = 1; i < width; i++) {
      if (i % widthLine == 0) {
        Path linePath = Path();
        linePath.addRect(
            Rect.fromLTRB(i.toDouble(), 0, (i + 2).toDouble(), height));
        canvas.drawPath(linePath, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class NEClass {}
