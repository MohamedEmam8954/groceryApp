import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grocery/core/services/firebase_services.dart';
import 'package:grocery/core/utils/dependency_injection.dart';
import 'package:grocery/features/profile/data/models/wish_list_model.dart';
import 'package:grocery/features/profile/data/repo/wishListRepo/wishlist_repo.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/wishlistcubit/wish_list_cubit_state.dart';

class WishListCubit extends Cubit<WishListCubitState> {
  WishListCubit(this.wishlistRepo) : super(InitialWishList());
  final Map<String, WishListModel> _wishListItem = {};
  WishlistRepo wishlistRepo;
  Map<String, WishListModel> get getWishList => _wishListItem;

  addOrRemoveWishList({required String productId}) async {
    emit(LoadingWishList(productid: productId));
    var data = await getIt.get<FirebaseServices>().getUserDocument()!.get();
    List<dynamic> wishListfromFb = data["wishList"];
    _wishListItem.clear();

    for (int i = 0; i < wishListfromFb.length; i++) {
      _wishListItem.putIfAbsent(
        wishListfromFb[i]["productId"],
        () => WishListModel(
            id: wishListfromFb[i]["uuid"],
            productId: wishListfromFb[i]["productId"]),
      );
    }
    emit(AddWishListSucessfully());
  }

  addproductToWishListOnline(String productId) {
    wishlistRepo.addProductToWishList(productId);
  }

  removeWishListItem({required String productid}) async {
    final removeproduct = _wishListItem.remove(productid);
    if (removeproduct != null) {
      emit(LoadingWishList(productid: productid));
      await wishlistRepo.removeProductFromWishList(
          productId: removeproduct.productId, uid: removeproduct.id);
      emit(RemoveWishListItemSucessfully());
    }
  }

  deleteAllWishList() {
    wishlistRepo.removeAllWishList();
    _wishListItem.clear();
    emit(DeleteAllWishListSucessfully());
  }
}
