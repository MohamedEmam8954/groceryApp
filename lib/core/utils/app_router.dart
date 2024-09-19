import 'package:go_router/go_router.dart';
import 'package:grocery/features/home/presentation/views/browseAllProduct.dart';
import 'package:grocery/features/home/presentation/views/navgationView.dart';
import 'package:grocery/features/home/presentation/views/onsaleView.dart';
import 'package:grocery/features/profile/presentation/views/wishlistview.dart';

class AppRouter {
  static String onsaleView = "/OnSale";
  static String navigation = "/";
  static String browseAllProduct = "/browseallproduct";
  static String showProduct = "/showProduct";
  static String wishListView = "/wishListView";
  static GoRouter goRoute = GoRouter(
    routes: [
      GoRoute(
        path: onsaleView,
        builder: (context, state) => const OnSaleView(
          isSale: false,
        ),
      ),
      GoRoute(
        path: navigation,
        builder: (context, state) => const NavgationView(),
      ),
      GoRoute(
        path: browseAllProduct,
        builder: (context, state) => const BrowseAllProductView(),
      ),
      GoRoute(
        path: wishListView,
        builder: (context, state) => const WishListView(),
      ),
    ],
  );
}
