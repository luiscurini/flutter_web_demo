import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web/base/view_model.dart';
import 'package:provider/provider.dart';
import '../locator/locator.dart';

typedef ViewModelProvided<T> = FutureOr<void> Function(T viewModel);
typedef ViewModelBuilder<T> = Widget Function(
  BuildContext context,
  T viewModel,
  Widget? child,
);

class ViewModelProvider<T extends ViewModel> extends StatefulWidget {
  const ViewModelProvider({
    super.key,
    required this.builder,
    this.onViewModelProvided,
    this.child,
  });

  final ViewModelBuilder<T> builder;
  final ViewModelProvided<T>? onViewModelProvided;
  final Widget? child;

  @override
  ViewModelProviderState<T> createState() => ViewModelProviderState<T>();
}

class ViewModelProviderState<T extends ViewModel>
    extends State<ViewModelProvider<T>> {
  late T viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = locator<T>();
    final result = widget.onViewModelProvided?.call(viewModel);
    if (result is Future) {
      unawaited(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => viewModel,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
