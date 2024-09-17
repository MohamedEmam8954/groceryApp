import 'package:go_router/go_router.dart';
import 'package:grocery/features/home/presentation/views/browseAllProduct.dart';
import 'package:grocery/features/home/presentation/views/navgationView.dart';
import 'package:grocery/features/home/presentation/views/onsaleView.dart';

class AppRouter {
  static String onsaleView = "/OnSale";
  static String navigation = "/";
  static String browseAllProduct = "/browseallproduct";
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
    ],
  );
}
