import 'package:flutter/material.dart';
import 'package:frosty_glass_app/effects/frosty_glass_effect.dart';

class BackgroundView extends StatefulWidget {
  const BackgroundView({super.key});

  @override
  State<BackgroundView> createState() => _BackgroundViewState();
}

class _BackgroundViewState extends State<BackgroundView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> animationColor;

  late AnimationController _controllerOpacity;
  late Animation<double> animationOpacity;

  late Color _beginColor;
  late Color _endColor;

  final _colors = [
    Colors.black54,
    Colors.black,
  ];

  final defaultDuration = const Duration(milliseconds: 3000);
  final defaulReversetDuration = const Duration(milliseconds: 3000);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: defaultDuration,
      reverseDuration: defaulReversetDuration,
    );

    _controllerOpacity = AnimationController(
      vsync: this,
      duration: defaultDuration,
      reverseDuration: defaulReversetDuration,
    );

    _beginColor = _colors[0];
    _endColor = _colors[1];

    animationOpacity = Tween<double>(
      begin: 0.1,
      end: 0.3,
    ).animate(_controllerOpacity)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _controllerOpacity.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _controllerOpacity.forward();
          }
        },
      );

    animationColor = ColorTween(
      begin: _beginColor,
      end: _endColor,
    ).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controllerOpacity.forward();
    _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return FrostyGlassEffect(
            sigmaX: 8,
            sigmaY: 8,
            opacity: animationOpacity.value,
            color: animationColor.value,
            child: Image.network(
              "https://images.unsplash.com/photo-1547499417-61a435d27cb3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2574&q=80",
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
