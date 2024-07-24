import 'package:flutter/material.dart';
import 'package:indexed_list_view/indexed_list_view.dart';
import 'package:provider/provider.dart';

import '../overview_view_model.dart';
import 'overview_tile.dart';

class OverviewIdleWidget extends StatelessWidget {
  const OverviewIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const _DesktopOverview();
  }
}

class _DesktopOverview extends StatelessWidget {
  const _DesktopOverview();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OverviewViewModel>();
    final overviewResult = viewModel.overviewResult;

    return IndexedListView.builder(
        controller: IndexedScrollController(initialIndex: 0),
        minItemCount: 0,
        maxItemCount: overviewResult.length - 1,
        itemBuilder: (context, index) {
          final restaurant = overviewResult[index];
          return OverviewTile(restaurant: restaurant);
        });

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
