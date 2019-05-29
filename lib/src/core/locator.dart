import 'package:get_it/get_it.dart';
import 'package:flutter_architecture_comparison/src/core/services/repository.dart';
import 'package:flutter_architecture_comparison/src/architectures/scoped_model/scoped_models/posts_model.dart';
import 'package:flutter_architecture_comparison/src/architectures/provider/viewmodels/posts_provider_model.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => Repository());  

  locator.registerFactory(() => PostsScopedModel());
  locator.registerFactory(() => PostsProviderModel());
}
