class WishListCubitState {}

class InitialWishList extends WishListCubitState {}

class LoadingWishList extends WishListCubitState {
  final String productid;

  LoadingWishList({required this.productid});
}

class AddWishListSucessfully extends WishListCubitState {}

class RemoveWishListItemSucessfully extends WishListCubitState {}

class DeleteAllWishListSucessfully extends WishListCubitState {}
