import 'package:flutter/material.dart';

import 'mms_loading_dots_widget.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MmsLoadingDotsWidget(
        color: Theme.of(context).colorScheme.primary,
        width: 200,
        height: 50,
      ),
    );
  }
}
