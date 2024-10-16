import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/profile/data/models/wish_list_model.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/wishlistcubit/wish_list_cubit_state.dart';

class WishListCubit extends Cubit<WishListCubitState> {
  WishListCubit() : super(InitialWishList());
  final Map<String, WishListModel> _wishListItem = {};

  Map<String, WishListModel> get getWishList => _wishListItem;

  addOrRemoveWishList({required String productId}) {
    if (_wishListItem.containsKey(productId)) {
      removeWishListItem(productid: productId);
    } else {
      _wishListItem.putIfAbsent(
        productId,
        () =>
            WishListModel(id: DateTime.now().toString(), productId: productId),
      );

      emit(AddWishListSucessfully());
    }
  }

  removeWishListItem({required String productid}) {
    _wishListItem.remove(productid);
    emit(RemoveWishListItemSucessfully());
  }

  deleteAllWishList() {
    _wishListItem.clear();
    emit(DeleteAllWishListSucessfully());
  }
}
