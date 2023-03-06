import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLogo extends StatefulWidget {
  const AppLogo({super.key});

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fontSizeAnimation;
  final duration = const Duration(milliseconds: 600);
  @override
  void initState() {
    controller = AnimationController(
      duration: duration,
      reverseDuration: duration,
      vsync: this,
    );

    // Font size conf
    fontSizeAnimation = Tween<double>(begin: 80, end: 86).animate(controller)
      ..addStatusListener(
        _fontSizeRepeatAnimation,
      );

    super.initState();
    controller.forward();
  }

  void _fontSizeRepeatAnimation(status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller.forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 180,
                      width: 180,
                      child: Stack(
                        children: [
                          const GlowCircle(),
                          Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                              color: Colors.white,
                              size: 200,
                            ),
                          ),
                          Center(
                            child: Container(
                              color: Colors.red.withOpacity(0.0),
                              child: FittedBox(
                                child: Text(
                                  "F5",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontSize: fontSizeAnimation.value,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      height: 46,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 40.0,
                          // fontFamily: 'Horizon',
                        ),
                        child: AnimatedTextKit(
                          pause: const Duration(milliseconds: 400),
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText('PEOPLE'),
                            RotateAnimatedText('EVENTS'),
                            RotateAnimatedText('PLACES'),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 46,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 40.0,
                          // fontFamily: 'Horizon',
                        ),
                        child: AnimatedTextKit(
                          pause: const Duration(milliseconds: 450),
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText('PEOPLE'),
                            RotateAnimatedText('EVENTS'),
                            RotateAnimatedText('PLACES'),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      // fontFamily: 'Horizon',
                    ),
                    child: AnimatedTextKit(
                      pause: const Duration(milliseconds: 2000),
                      repeatForever: false,
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TyperAnimatedText('The Web3 DAO TALKS'),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class GlowCircle extends StatefulWidget {
  const GlowCircle({
    super.key,
  });

  @override
  State<GlowCircle> createState() => _GlowCircleState();
}

class _GlowCircleState extends State<GlowCircle> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    controller.repeat(reverse: true);
    animation = Tween(begin: 2.0, end: 32.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(90),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: animation.value,
            spreadRadius: animation.value,
          )
        ],
      ),
    );
  }
}
