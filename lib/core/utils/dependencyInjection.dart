import 'package:get_it/get_it.dart';
import 'package:grocery/core/cache/my_cache_helper.dart';

GetIt getIt = GetIt.instance;

void init() {
  getIt.registerSingleton<MyCacheHelper>(MyCacheHelper());
}
