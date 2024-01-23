import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'droplet_config.freezed.dart';

@freezed
class DropletConfig with _$DropletConfig {
  const factory DropletConfig({
    required int density,
    required double length,
    required double angle,
    required Paint paint,
    required int time,
  }) = _DropletConfig;
}
