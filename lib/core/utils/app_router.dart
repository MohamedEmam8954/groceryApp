import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/utils/dependency_injection.dart';
import 'package:grocery/features/auth/presentation/views/forget_password_view.dart';
import 'package:grocery/features/auth/presentation/views/loginview.dart';
import 'package:grocery/features/auth/presentation/views/signupview.dart';
import 'package:grocery/features/categories/data/model/categoryViewItemmodel.dart';
import 'package:grocery/features/categories/presentation/views/all_product_category.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/views/browse_all_product.dart';
import 'package:grocery/features/home/presentation/views/navgation_view.dart';
import 'package:grocery/features/home/presentation/views/onsale_view.dart';
import 'package:grocery/features/home/presentation/views/productdetailsview.dart';
import 'package:grocery/features/profile/data/repo/orderRepo/order_repo_imp.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/orderCubit/order_cubit.dart';
import 'package:grocery/features/profile/presentation/views/history_view.dart';
import 'package:grocery/features/profile/presentation/views/orderview.dart';
import 'package:grocery/features/profile/presentation/views/wishlistview.dart';

abstract class AppRouter {
  static String loginView = "/login";
  static String onsaleView = "/OnSale";
  static String navigation = "/navigation";
  static String browseAllProduct = "/browseallproduct";
  static String productDetails = "/Productdetails";
  static String wishListView = "/wishListView";
  static String orderView = "/orderview";
  static String historyView = "/historyview";
  static String signUpView = "/Signin";
  static String forgetpassword = "/forgetpassword";
  static String allProductcategories = "/allProductcategories";

  static GoRouter goRoute = GoRouter(
    initialLocation: (FirebaseAuth.instance.currentUser != null &&
            FirebaseAuth.instance.currentUser!.emailVerified)
        ? AppRouter.navigation
        : AppRouter.loginView,
    routes: [
      GoRoute(
        path: loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: onsaleView,
        builder: (context, state) => const OnSaleView(),
      ),
      GoRoute(
        path: navigation,
        builder: (context, state) => const NavgationView(),
      ),
      GoRoute(
        path: browseAllProduct,
        builder: (context, state) => BrowseAllProductView(
          productModel: state.extra as List<ProductModel>,
        ),
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
        builder: (context, state) => BlocProvider(
          create: (context) => OrderCubit(getIt.get<OrderRepoImp>()),
          child: const OrderView(),
        ),
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
