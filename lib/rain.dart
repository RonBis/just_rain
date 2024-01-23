import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_rain/data/droplet.dart';
import 'package:just_rain/data/droplet_config.dart';

class RainWidget extends StatelessWidget {
  const RainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            RainCanvas(
              canvasSize: Size(constraints.maxWidth, constraints.maxHeight),
              dropletConfig: DropletConfig(
                density: 400,
                length: 50,
                angle: 65 * pi / 180,
                time: 50,
                paint: Paint()
                  ..color = Colors.white
                  ..style = PaintingStyle.fill,
              ),
            ),
            const Center(
              child: Text(
                "Just Rain",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Amatic",
                  fontSize: 34,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RainCanvas extends StatefulWidget {
  const RainCanvas({
    super.key,
    required this.canvasSize,
    required this.dropletConfig,
  });

  final Size canvasSize;
  final DropletConfig dropletConfig;

  @override
  State<RainCanvas> createState() => _RainCanvasState();
}

class _RainCanvasState extends State<RainCanvas> {
  late Timer timer;
  List<Droplet> droplets = [];

  @override
  void initState() {
    super.initState();
    var config = widget.dropletConfig;
    timer = Timer.periodic(Duration(milliseconds: config.time), (timer) {
      setState(() {
        for (var droplet in droplets) {
          droplet.update(widget.canvasSize, config);
        }
      });
    });
    droplets = List.generate(
      config.density,
      (index) => Droplet(widget.canvasSize, config.angle),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RainPainter(
        droplets: droplets,
        config: widget.dropletConfig,
      ),
    );
  }
}

class RainPainter extends CustomPainter {
  final List<Droplet> droplets;
  final DropletConfig config;

  RainPainter({required this.droplets, required this.config});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.black, BlendMode.src);
    for (var droplet in droplets) {
      canvas.drawLine(
        droplet.position,
        droplet.position + Offset.fromDirection(config.angle, config.length),
        config.paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
