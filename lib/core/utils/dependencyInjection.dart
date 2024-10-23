import 'package:get_it/get_it.dart';
import 'package:grocery/core/cache/my_cache_helper.dart';

import 'package:grocery/features/auth/data/repo/authrepoimp/auth_repo_imp.dart';

GetIt getIt = GetIt.instance;

void init() {
  getIt.registerSingleton<MyCacheHelper>(MyCacheHelper());
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp());
}

// void registerAppUtils(BuildContext context) {
//   getIt.registerSingleton<AppUtils>(AppUtils(context));
// }
