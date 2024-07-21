import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../domain/model/overview_results.dart';

class OverviewTile extends StatelessWidget {
  final OverviewResults restaurant;
  final bool isSelected;

  const OverviewTile(
      {super.key, required this.restaurant, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: isSelected ? 10.0 : 0.0,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: restaurant.photo,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: List.generate(
                      4,
                      (index) => Icon(
                        index < restaurant.price
                            ? Icons.euro
                            : Icons.euro_outlined,
                        color:
                            index < restaurant.price ? Colors.red : Colors.grey,
                        size: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    restaurant.address ?? "Unknown address",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 5),
                  if (!isMobile)
                    Text(
                      '"${restaurant.tip}"',
                      style: const TextStyle(
                          fontSize: 14, fontStyle: FontStyle.italic),
                    ),
                ],
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 5),
                Text(
                  restaurant.rating.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
