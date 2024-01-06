import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class RainWidget extends StatelessWidget {
  const RainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => RainCanvas(
        canvasDimensions: (constraints.maxWidth, constraints.maxHeight),
        dropletDensity: 1000,
        dropletLength: 50,
        dropletTime: 50,
        dropletAngle: 60,
      ),
    );
  }
}

class RainCanvas extends StatefulWidget {
  const RainCanvas({
    super.key,
    required this.canvasDimensions,
    required this.dropletDensity,
    this.dropletLength = 10,
    this.dropletTime = 10,
    this.dropletAngle = 70,
  });

  final (double, double) canvasDimensions;
  final int dropletDensity;
  final double dropletLength;
  /// In milliseconds
  final int dropletTime;
  /// In degrees
  final double dropletAngle;

  @override
  State<RainCanvas> createState() => _RainCanvasState();
}

class _RainCanvasState extends State<RainCanvas> {
  late Timer timer;
  List<Droplet> droplets = [];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: widget.dropletTime), (timer) {
      setState(() {
        for (var droplet in droplets) {
          droplet.update();
        }
      });
    });
    droplets = List.generate(
      widget.dropletDensity,
      (index) => Droplet(
        length: widget.dropletLength,
        direction: widget.dropletAngle * pi / 180,
        canvasDimensions: widget.canvasDimensions,
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: RainPainter(droplets));
  }
}

class RainPainter extends CustomPainter {
  final List<Droplet> droplets;

  RainPainter(this.droplets);

  @override
  void paint(Canvas canvas, Size size) {
    for (var droplet in droplets) {
      droplet.draw(canvas);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Droplet {
  final paint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;
  final double length;
  final double direction;

  /// (width, height)
  final (double, double) canvasDimensions;
  late Offset position;

  Droplet({
    required this.length,
    required this.direction,
    required this.canvasDimensions,
  }) {
    position = _getRandomStartPosition(canvasDimensions);
  }

  void draw(Canvas canvas) {
    canvas.drawLine(
      position,
      position + Offset.fromDirection(direction, length),
      paint,
    );
  }

  void update() {
    position = position + Offset.fromDirection(direction, length);
    // if (position.dy > canvasDimensions.$2 ||
    //     position.dx > canvasDimensions.$1) {
    //   // reset droplet position
    //   print("repositioning droplet");
    //   position = _getRandomStartPosition(canvasDimensions);
    // }
    if (position.dx < 0) {
      // direction is towards left
      position = Offset(canvasDimensions.$1, position.dy);
    } else if (position.dx > canvasDimensions.$1) {
      // direction is towards right
      position = Offset(0, position.dy);
    } else if (position.dy > canvasDimensions.$2) {
      // exceeded canvas height
      position = _getRandomStartPosition(canvasDimensions);
    }
    // print({hashCode, position});
  }

  /// Starting position may vary from
  /// - y-axis: -45 to -15
  /// - x-axis: 0 to canvas.width
  static Offset _getRandomStartPosition((double, double) canvasDimension) {
    final yRange = (0, -canvasDimension.$1);
    final xRange = (0, canvasDimension.$2);
    return Offset(
      rnd.nextDouble() * (xRange.$2 - xRange.$1) + xRange.$1,
      rnd.nextDouble() * (yRange.$2 - yRange.$1) + yRange.$1,
    );
  }
}

final rnd = Random();
