
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:inventoryapp/features/home/data/datasources/home_remote_data_src.dart';
import 'package:inventoryapp/features/home/data/repos/home_repo_impl.dart';
import 'package:inventoryapp/features/home/domain/repos/home_repo.dart';
import 'package:inventoryapp/features/home/presentation/controller/home_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import '../../features/auth/presentation/controller/auth_controllere.dart';
import '../app/cache/cache_helper.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(http.Client.new);
  await _cacheInit();
  await _userAuthInit();
  await home();

}

Future<void> _cacheInit() async {
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton<SharedPreferences>(() => prefs)
    ..registerLazySingleton(() => CacheHelper(sl()));

}

Future<void> _userAuthInit() async {
  // Registering AuthRemoteDataSrc if not already registered
  sl.registerLazySingleton<AuthRemoteDataSrc>(() =>
      AuthRemoteDataSrcImp(sl())); //object initialize and inject dependencies

  // Registering AuthRepo and its implementation
  sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(sl<AuthRemoteDataSrc>()));

  // Registering AuthController
  sl.registerLazySingleton<AuthController>(
      () => AuthController(sl<AuthRepo>()));
}


Future<void> home() async{
  sl.registerLazySingleton<HomeRemoteDataSrc>(
          ()=>HomeRemoteDataSrcImp(sl()));

  sl.registerLazySingleton<HomeRepo>(
          ()=>HomeRepoImpl(sl()));

  sl.registerLazySingleton<HomeController>(
          ()=>HomeController(sl<HomeRepo>()));

}




