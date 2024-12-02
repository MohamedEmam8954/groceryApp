import 'package:get_it/get_it.dart';
import 'package:grocery/core/cache/my_cache_helper.dart';
import 'package:grocery/core/services/firebase_services.dart';
import 'package:grocery/features/auth/data/repo/repo/firebase_repo_imp.dart';

import 'package:grocery/features/auth/data/repo/authrepo/auth_repo_imp.dart';
import 'package:grocery/features/home/repo/home_repo_imp.dart';
import 'package:grocery/features/profile/data/repo/orderRepo/order_repo_imp.dart';
import 'package:grocery/features/profile/data/repo/wishListRepo/wishlist_repo_imp.dart';
import 'package:grocery/features/shopping/data/repo/cart_repo_imp.dart';

GetIt getIt = GetIt.instance;

void init() {
  getIt.registerSingleton<MyCacheHelper>(MyCacheHelper());
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp());
  getIt.registerSingleton<FirebaseServices>(FirebaseServices());
  getIt.registerSingleton<FirebaseRepoImp>(FirebaseRepoImp());
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp());
  getIt.registerSingleton<CartRepoImp>(CartRepoImp());
  getIt.registerSingleton<WishlistRepoImp>(WishlistRepoImp());
  getIt.registerSingleton<OrderRepoImp>(OrderRepoImp());
}

// void registerAppUtils(BuildContext context) {
//   getIt.registerSingleton<AppUtils>(AppUtils(context));
// }
