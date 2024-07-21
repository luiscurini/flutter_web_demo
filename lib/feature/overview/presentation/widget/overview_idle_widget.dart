import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../overview_view_model.dart';

class OverviewIdleWidget extends StatelessWidget {
  const OverviewIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO Step #1
    // Show a list in the _DesktopOverview by using the library indexed_list_view
    // See https://pub.dev/packages/indexed_list_view/example
    // When creating the list, minItemCount and maxItemCount can be
    // passed, so only the amount of restaurants are created.
    //
    // As an items, use the OverviewTile widget
    return const _DesktopOverview();
  }
}

class _DesktopOverview extends StatelessWidget {
  const _DesktopOverview();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OverviewViewModel>();

    return Center(
        child: Text(
      'Hello Flutter Web Demo, '
      '${viewModel.overviewResult.length + 1} restaurants were loaded',
      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    ));

    // TODO Step #2
    // Now that the list was loaded and shown. Use the library flutter_map to show a map
    // on the right side of the list. The list should take 2/5 of the screen
    // and the map the rest
    // Map documentation https://docs.fleaflet.dev/
    // As zoom and location use the values defined in the constants file.
    // In the TitleLayer pass as tileProvider: CancellableNetworkTileProvider())
    // to avoid issues with the logger
    //
    // After the map was loaded, show a marker in the map for all the
    // restaurants.

    // TODO Step #3
    // Once the markers are shown. It's time to add some interaction.
    // 1. When the mouse pointer is over one of the items of the list:
    //    - Make the OverviewTile more prominent, e.g changing elevation, text color, adding an icon
    //    - Change the Marker so, the selected restaurant is shown.
    // 2. When clicking on a Marker on the map:
    //    - Make the OverviewTile prominent (already done in last step)
    //    - Scroll automatically to the position in the list (hint use IndexScrollController of the library)
    // Hint there's already a value and a method in the viewModel to update the
    // the selected item.
  }
}
