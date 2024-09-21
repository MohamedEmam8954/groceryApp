import 'package:go_router/go_router.dart';
import 'package:grocery/features/home/presentation/views/browseAllProduct.dart';
import 'package:grocery/features/home/presentation/views/navgationView.dart';
import 'package:grocery/features/home/presentation/views/onsaleView.dart';
import 'package:grocery/features/home/presentation/views/productdetailsview.dart';
import 'package:grocery/features/profile/presentation/views/historyView.dart';
import 'package:grocery/features/profile/presentation/views/orderview.dart';
import 'package:grocery/features/profile/presentation/views/wishlistview.dart';

class AppRouter {
  static String onsaleView = "/OnSale";
  static String navigation = "/";
  static String browseAllProduct = "/browseallproduct";
  static String productDetails = "/Productdetails";
  static String wishListView = "/wishListView";
  static String orderView = "/orderview";
  static String historyView = "/historyview";

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
        path: productDetails,
        builder: (context, state) => const ProductDetailsView(),
      ),
      GoRoute(
        path: wishListView,
        builder: (context, state) => const WishListView(),
      ),
      GoRoute(
        path: orderView,
        builder: (context, state) => const OrderView(),
      ),
      GoRoute(
        path: historyView,
        builder: (context, state) => const HistoryView(),
      ),
    ],
  );
}
