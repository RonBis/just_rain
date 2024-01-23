import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_rain/data/droplet_config.dart';

class Droplet {
  late Offset position;

  Droplet(Size canvasSize, double angle) {
    position = _assignRandomStartPosition(canvasSize, angle);
  }

  void update(Size canvasSize, DropletConfig config) {
    position = position + Offset.fromDirection(config.angle, config.length);
    if (position.dy < 0 ||
        position.dx > canvasSize.width ||
        position.dy > canvasSize.height) {
      position = _assignRandomStartPosition(canvasSize, config.angle);
    }
  }

  /// Starting position may vary from
  /// - y-axis: -100 to -0
  /// - x-axis: 0 to canvas.width
  static Offset _assignRandomStartPosition(Size canvasSize, double angle) {
    final xRange = (-canvasSize.width, canvasSize.width);
    const yRange = (0, -100);
    return Offset(
      _rnd.nextDouble() * (xRange.$2 - xRange.$1) + xRange.$1,
      _rnd.nextDouble() * (yRange.$2 - yRange.$1) + yRange.$1,
    );
  }
}

final _rnd = Random();
