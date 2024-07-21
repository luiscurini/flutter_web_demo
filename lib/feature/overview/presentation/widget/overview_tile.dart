import 'package:flutter/material.dart';

import '../../domain/model/overview_results.dart';

class OverviewTile extends StatelessWidget {
  final OverviewResults restaurant;

  const OverviewTile({super.key, required this.restaurant});

  // TODO Step #1
  // Update this widget so the relevant information of the restaurant is show.
  //
  // Flutter widgets reference https://docs.flutter.dev/ui/widgets
  //
  // This widget could include:
  // - Image of the restaurant. Tip, use CachedNetworkImage and pass the URL
  // - Name of the restaurant
  // - Rating
  // - Pricing (int from 1 to 4) where 1 is the least expensive, this could be shown with icons
  // - Address
  // - Tip from people
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        elevation: 0.0,
        child: Padding(
            padding: const EdgeInsets.all(10), child: Text(restaurant.name)));
  }
}
