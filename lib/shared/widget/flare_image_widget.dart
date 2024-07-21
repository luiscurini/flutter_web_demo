import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';

/// [FlareImageWidget] used to specify the asset path to component_library
/// This should be used to access Flare animation
class FlareImageWidget extends StatelessWidget {
  const FlareImageWidget({
    super.key,
    required this.src,
    this.boundsNode,
    this.animation,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.isPaused = false,
    this.snapToEnd = false,
    this.controller,
    this.callback,
    this.color,
    this.shouldClip = true,
    this.sizeFromArtboard = false,
    this.artboard,
    this.antialias = true,
  });

  final String src;
  final String? boundsNode;
  final String? animation;
  final BoxFit fit;
  final Alignment alignment;
  final bool isPaused;
  final bool snapToEnd;
  final FlareController? controller;
  final FlareCompletedCallback? callback;
  final Color? color;
  final bool shouldClip;
  final bool sizeFromArtboard;
  final String? artboard;
  final bool antialias;

  @override
  Widget build(BuildContext context) {
    return FlareActor(
      src,
      boundsNode: boundsNode,
      animation: animation,
      fit: fit,
      alignment: alignment,
      isPaused: isPaused,
      snapToEnd: snapToEnd,
      controller: controller,
      callback: callback,
      color: color,
      shouldClip: shouldClip,
      sizeFromArtboard: sizeFromArtboard,
      artboard: artboard,
      antialias: antialias,
    );
  }
}
