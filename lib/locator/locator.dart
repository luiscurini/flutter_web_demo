import 'package:dio/dio.dart';
import 'package:flutter_web/base/constants.dart';
import 'package:get_it/get_it.dart';
import '../feature/overview/data/mapper/overview_mapper.dart';
import '../feature/overview/data/repository/overview_repository.dart';
import '../feature/overview/presentation/overview_view_model.dart';

GetIt locator = GetIt.instance;

extension Initializer on GetIt {
  void initDependencies() {
    registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: "https://api.foursquare.com", headers: {
        'Authorization': authorization,
      })),
    );
    registerLazySingleton(() => OverviewMapper());
    registerFactory(() => OverviewRepository(get(), get()));
    registerFactory(() => OverviewViewModel(get()));
  }
}
