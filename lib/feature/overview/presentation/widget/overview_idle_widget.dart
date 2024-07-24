import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:indexed_list_view/indexed_list_view.dart';
import 'package:latlong2/latlong.dart';
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

    return Row(children: [
      Expanded(
          flex: 2,
          child: IndexedListView.builder(
              controller: IndexedScrollController(initialIndex: 0),
              minItemCount: 0,
              maxItemCount: overviewResult.length - 1,
              itemBuilder: (context, index) {
                final restaurant = overviewResult[index];
                return OverviewTile(restaurant: restaurant);
              })),
      Expanded(
        flex: 3,
        child: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(48.7665, 11.4258),
            initialZoom: 14.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
              tileProvider: CancellableNetworkTileProvider(),
            ),
            MarkerLayer(
              markers: overviewResult.mapIndexed((index, element) {
                return Marker(
                  width: 40,
                  height: 40,
                  point: LatLng(element.latitude, element.longitude),
                  child: Icon(Icons.location_on_outlined,
                      color: Theme.of(context).colorScheme.secondary, size: 40),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    ]);

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
