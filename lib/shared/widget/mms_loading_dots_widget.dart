import 'package:flutter/material.dart';

import '../../assets/assets.gen.dart';
import 'flare_image_widget.dart';

class MmsLoadingDotsWidget extends StatelessWidget {
  const MmsLoadingDotsWidget({
    super.key,
    this.color,
    this.width = 100,
    this.height = 25,
  });

  final Color? color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final loadingDotsColor = color ?? Colors.deepOrange;

    return SizedBox(
      width: width,
      height: height,
      child: _MMLoadingWidget(color: loadingDotsColor),
    );
  }
}

class _MMLoadingWidget extends StatefulWidget {
  const _MMLoadingWidget({
    required this.color,
  });

  final Color color;

  @override
  _MMLoadingWidgetState createState() => _MMLoadingWidgetState();
}

class _MMLoadingWidgetState extends State<_MMLoadingWidget> {
  static const loadingAnimationName = 'button_loading';
  static const loopingAnimationName = 'looping';

  String animationName = loadingAnimationName;

  @override
  Widget build(BuildContext context) {
    return FlareImageWidget(
      src: Assets.flr.buttonLoading.path,
      animation: animationName,
      color: widget.color,
      callback: (finishedAnimation) {
        if (finishedAnimation == loadingAnimationName) {
          setState(() {
            animationName = loopingAnimationName;
          });
        }
      },
    );
  }
}
