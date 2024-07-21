import 'package:collection/collection.dart';
import 'package:flutter_web/feature/overview/data/model/overview_results_dto.dart';

import '../../domain/model/overview_results.dart';

class OverviewMapper {
  List<OverviewResults> map(OverviewResultsDto dto) {
    return dto.results
            ?.map((entry) {
              final photo = entry.photos?.firstOrNull;

              if (entry.name == null ||
                  entry.geocodes?.main?.longitude == null ||
                  entry.geocodes?.main?.latitude == null ||
                  entry.rating == null ||
                  photo?.prefix == null ||
                  photo?.suffix == null) {
                return null;
              }
              return OverviewResults(
                  entry.name!,
                  entry.location!.formattedAddress,
                  '${photo!.prefix!}400x400${photo.suffix!}',
                  entry.geocodes!.main!.latitude!,
                  entry.geocodes!.main!.longitude!,
                  entry.rating!,
                  entry.price ?? 1,
                  entry.tips?.firstOrNull?.text);
            })
            .whereNotNull()
            .toList() ??
        [];
  }
}
