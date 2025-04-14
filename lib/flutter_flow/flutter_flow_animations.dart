import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

enum AnimationTrigger {
  onPageLoad,
  onActionTrigger,
}

class AnimationInfo {
  AnimationInfo({
    required this.trigger,
    required this.effects,
    this.curve = Curves.easeInOut,
    this.delay = 0.0,
    this.duration = 600,
    this.controller,
    this.autoPlay = true,
    this.animate = true,
    this.applyInitialState = false,
  }) : effectsBuilder = null;

  final AnimationTrigger trigger;
  final List<Effect>? effects;
  final List<Effect> Function()? effectsBuilder;
  final Curve curve;
  final double delay;
  final double duration;
  final AnimationController? controller;
  final bool autoPlay;
  final bool animate;
  final bool applyInitialState;
}

void setupAnimations(Iterable<AnimationInfo> animations, TickerProvider vsync) {
  for (var animation in animations) {
    animation.effects?.forEach((effect) {
      effect
        ..curve = animation.curve
        ..delay = animation.delay.milliseconds
        ..duration = animation.duration.milliseconds;
    });
  }
}

extension AnimatedWidgetExtension on Widget {
  Widget animateOnPageLoad(AnimationInfo animationInfo) => animationInfo.animate
      ? Animate(
          autoPlay: animationInfo.autoPlay,
          effects: animationInfo.effects!,
        ).child(this)
      : this;

  Widget animateOnActionTrigger(
    AnimationInfo animationInfo, {
    bool hasBeenTriggered = false,
  }) =>
      animationInfo.animate
          ? Animate(
              controller: animationInfo.controller,
              autoPlay: animationInfo.autoPlay && hasBeenTriggered,
              effects: animationInfo.effectsBuilder?.call() ??
                  animationInfo.effects!,
            ).child(this)
          : this;
}