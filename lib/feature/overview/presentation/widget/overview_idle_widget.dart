import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_web/base/constants.dart';
import 'package:indexed_list_view/indexed_list_view.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '../overview_view_model.dart';
import 'overview_tile.dart';

class OverviewIdleWidget extends StatelessWidget {
  const OverviewIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OverviewViewModel>();
    return _DesktopOverview(viewModel: viewModel);
  }
}

class _DesktopOverview extends StatefulWidget {
  const _DesktopOverview({required this.viewModel});

  final OverviewViewModel viewModel;

  @override
  State<StatefulWidget> createState() => _DesktopOverviewState();
}

class _DesktopOverviewState extends State<_DesktopOverview> {
  late IndexedScrollController _scrollController;

  void _scrollToItem(int index) {
    _scrollController.animateToIndex(index);
  }

  @override
  void initState() {
    _scrollController = IndexedScrollController(
        initialIndex: widget.viewModel.selectedIndex ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final overviewResult = widget.viewModel.overviewResult;

    return Row(children: [
      Expanded(
          flex: 2,
          child: IndexedListView.builder(
              controller: _scrollController,
              minItemCount: 0,
              maxItemCount: overviewResult.length - 1,
              itemBuilder: (context, index) {
                final restaurant = overviewResult[index];
                return MouseRegion(
                  onEnter: (_) {
                    widget.viewModel.setSelectedItem(index);
                  },
                  onExit: (_) {
                    widget.viewModel.setSelectedItem(null);
                  },
                  child: OverviewTile(
                    restaurant: restaurant,
                    isSelected: widget.viewModel.selectedIndex == index,
                  ),
                );
              })),
      Expanded(
        flex: 3,
        child: FlutterMap(
          options: const MapOptions(
            initialCenter: location,
            initialZoom: zoomDesktop,
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
                  child: GestureDetector(
                    onTap: () {
                      widget.viewModel.setSelectedItem(index);
                      _scrollToItem(index);
                    },
                    child: Icon(
                        widget.viewModel.selectedIndex == index
                            ? Icons.location_on
                            : Icons.location_on_outlined,
                        color: widget.viewModel.selectedIndex == index
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
                        size: 40),
                  ));
            }).toList()),
          ],
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
