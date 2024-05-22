import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'src/data/datasources/api_service.dart';
import 'src/data/repositories/api_repository_impl.dart';
import 'src/domain/repositories/api_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();
  // configuracion de dio

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<ApiService>(ApiService(locator<Dio>()));

  locator.registerSingleton<ApiRepository>(
      ApiRepositoryImpl(locator<ApiService>()));
}
