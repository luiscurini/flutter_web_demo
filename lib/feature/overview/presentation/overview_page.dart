import 'package:flutter/material.dart';

import '../../../base/view_model_provider.dart';
import '../../../base/view_state.dart';
import '../../../shared/widget/custom_error_widget.dart';
import '../../../shared/widget/custom_loading_widget.dart';
import 'overview_view_model.dart';
import 'widget/overview_idle_widget.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<OverviewViewModel>(
      onViewModelProvided: (viewModel) async {
        return viewModel.onInit();
      },
      builder: (_, viewModel, ___) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: const Text(
              'Flutter Web - Restaurant Map Demo',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: switch (viewModel.state) {
            ViewState.error => const CustomErrorWidget(),
            ViewState.idle => const OverviewIdleWidget(),
            ViewState.loading => const CustomLoadingWidget(),
          },
        );
      },
    );
  }
}
