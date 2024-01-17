import 'package:get_it/get_it.dart';

import 'package:dio/dio.dart' as dio;
import 'core/api/api_client.dart';
import 'features/main/data/datasources/main_remote_data_source.dart';
import 'features/main/data/repository/main_repository_impl.dart';
import 'features/main/domain/repository/main_repository.dart';
import 'features/main/domain/usecases/post_usecases.dart';
import 'features/main/domain/usecases/todo_usecases.dart';
import 'features/main/presentation/cubit/post/posts_cubit.dart';
import 'features/main/presentation/cubit/todo/todo_cubit.dart';

final locator = GetIt.I;

void setup() {


  // ================ BLoC / Cubit ================ //

  locator.registerLazySingleton(() => TodoCubit(locator()));
  locator.registerLazySingleton(() => PostsCubit(locator()));

  // ================ UseCases ================ //
  locator.registerLazySingleton(() => GetTodoUsecase(locator()));
  locator.registerLazySingleton(() => GetPostsUsecase(locator()));


  // ================ Repository / Datasource ================ //

  locator.registerLazySingleton<MainRepository>(() => MainRepositoryImpl(locator()));


  locator.registerLazySingleton<MainRemoteDataSource>(() => MainRemoteDataSourceImpl(locator()));


  // ================ Core ================ //
  locator.registerLazySingleton<ApiClient>(() =>ApiClientImpl(locator()));

  locator.registerLazySingleton<dio.Dio>(() =>dio.Dio()
   );


  // ================ External ================ //
}
