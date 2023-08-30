import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../features/home/data/data_sources/home_local_data_sources_implemintation.dart';
import '../../../features/home/data/data_sources/home_remote_data_sources_implemintation.dart';
import '../../../features/home/data/repos/home_repo_impl.dart';
import '../api_service.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(apiService: getIt.get<ApiService>()),
    ),
  );
}
