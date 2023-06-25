import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedBluredBackground extends StatefulWidget {
  const AnimatedBluredBackground(
      {super.key, this.body, this.appBar, this.duration});
  final Widget? body;
  final AppBar? appBar;

  ///Controller duration in seconds
  final int? duration;

  @override
  State<AnimatedBluredBackground> createState() =>
      _AnimatedBluredBackgroundState();
}

class _AnimatedBluredBackgroundState extends State<AnimatedBluredBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration ?? 5),
      reverseDuration: Duration(seconds: widget.duration ?? 5),
    );

    _animation = Tween<double>(begin: 0.01, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller, curve: Curves.ease, reverseCurve: Curves.ease),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        extendBody: true,
        appBar: widget.appBar,
        body: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) => Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  color: Colors.deepPurple,
                  height: size.height * 0.2 * _animation.value,
                  width: size.width * 0.4 * _animation.value,
                ),
              ),
              Positioned(
                top: size.height * 0.4,
                left: size.width * 0.4,
                child: Container(
                  color: Colors.deepPurple,
                  height: 300 * (_animation.value),
                  width: 200 * (_animation.value),
                ),
              ),
              Positioned(
                top: size.height * 0.3,
                child: Container(
                  color: Colors.blue,
                  height: 100,
                  width: 200,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  color: Colors.blue,
                  height: (size.height - 150) * (1 - _animation.value) + 100,
                  width: 100,
                ),
              ),
              Positioned(
                top: size.height * _animation.value,
                child: Container(
                  color: Colors.deepPurple,
                  height: 400,
                  width: size.width * 0.6,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  color: Colors.deepPurple,
                  height: 150,
                  width: 100,
                ),
              ),
              Positioned(
                bottom: 0,
                right: size.width * 0.3 * (1 - _animation.value),
                child: Container(
                  color: Colors.blue,
                  height: 400,
                  width: size.width * 0.4,
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  color: Colors.white.withOpacity(0.3),
                  height: double.maxFinite,
                  width: double.maxFinite,
                ),
              ),
              widget.body ?? const SizedBox(),
            ],
          ),
        ));
  }
}
