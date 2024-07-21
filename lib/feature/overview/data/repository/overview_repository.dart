import 'dart:developer';

import 'package:dio/dio.dart';
import '../../../../base/constants.dart';
import '../mapper/overview_mapper.dart';
import '../model/overview_results_dto.dart';
import '../../domain/model/overview_results.dart';

class OverviewRepository {
  OverviewRepository(this._client, this._mapper);

  final Dio _client;
  final OverviewMapper _mapper;

  Future<List<OverviewResults>> getOverviewRestaurants() async {
    try {
      final response = await _client.get(
        '/v3/places/search',
        queryParameters: {
          'll':
              '${location.latitude.toString()},${location.longitude.toString()}',
          'categories': '4d4b7105d754a06374d81259',
          'limit': '50',
          'sort': 'RATING',
          'fields': 'name,rating,price,location,geocodes,photos,tastes,tips',
          'radius': '5000'
        },
      );
      final overviewDto = OverviewResultsDto.fromJson(response.data);
      final result = _mapper.map(overviewDto);
      return result;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      rethrow;
    }
  }
}
