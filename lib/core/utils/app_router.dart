import 'package:go_router/go_router.dart';
import 'package:grocery/features/auth/presentation/views/forgetPasswordview.dart';
import 'package:grocery/features/auth/presentation/views/signupview.dart';
import 'package:grocery/features/categories/data/model/categoryViewItemmodel.dart';
import 'package:grocery/features/categories/presentation/views/all_product_category.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/views/browseAllProduct.dart';
import 'package:grocery/features/home/presentation/views/navgation_view.dart';
import 'package:grocery/features/home/presentation/views/onsale_view.dart';
import 'package:grocery/features/home/presentation/views/productdetailsview.dart';
import 'package:grocery/features/profile/presentation/views/historyView.dart';
import 'package:grocery/features/profile/presentation/views/orderview.dart';
import 'package:grocery/features/profile/presentation/views/wishlistview.dart';

class AppRouter {
  // static String loginView = "/";
  static String onsaleView = "/OnSale";
  static String navigation = "/";
  static String browseAllProduct = "/browseallproduct";
  static String productDetails = "/Productdetails";
  static String wishListView = "/wishListView";
  static String orderView = "/orderview";
  static String historyView = "/historyview";
  static String signUpView = "/signUpView";
  static String forgetpassword = "/forgetpassword";
  static String allProductcategories = "/allProductcategories";

  static GoRouter goRoute = GoRouter(
    routes: [
      // GoRoute(
      //   path: loginView,
      //   builder: (context, state) => const LoginView(),
      // ),
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
        builder: (context, state) => ProductDetailsView(
          productModel: state.extra as ProductModel,
        ),
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
      GoRoute(
        path: signUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: forgetpassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: allProductcategories,
        builder: (context, state) => AllProductCategory(
          categoryViewItemModel: state.extra as CategoryViewItemModel,
        ),
      ),
    ],
  );
}
