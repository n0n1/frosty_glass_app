import 'dart:ui';

import 'package:flutter/material.dart';

class FrostyGlassEffect extends StatelessWidget {
  const FrostyGlassEffect({
    super.key,
    required this.child,
    Color? color,
    double? opacity,
    double? sigmaX,
    double? sigmaY,
  })  : _color = color,
        _sigmaX = sigmaX ?? 10,
        _sigmaY = sigmaY ?? 10,
        _opacity = opacity ?? 0.4;

  final Widget child;
  final Color? _color;
  final double? _opacity;
  final double? _sigmaX;
  final double? _sigmaY;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: child,
        ),
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: _sigmaX!, sigmaY: _sigmaY!),
              child: Container(
                decoration:
                    BoxDecoration(color: _color?.withOpacity(_opacity!)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
