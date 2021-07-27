import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart'; 
import 'data/api_repository.dart';
import 'features/home/home_bloc/home_bloc.dart';
import 'routing/navigation_service.dart';

/// sl: service locator
final getIt = GetIt.instance;

Future<void> init() async {

  getIt.registerLazySingleton<ApiRepo>(
        () => ApiRepo(
      client: getIt(),
    ),
  );

  Dio client = Dio(
    BaseOptions(
      contentType: 'application/json',
      receiveDataWhenStatusError: true,
    ),
  );
  getIt.registerLazySingleton<Dio>(() => client);

  getIt.registerLazySingleton(() => HomeBloc());
  getIt.registerLazySingleton(() => NavigationService());
}
