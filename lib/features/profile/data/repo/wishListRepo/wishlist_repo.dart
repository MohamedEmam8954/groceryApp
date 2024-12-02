abstract class WishlistRepo {
  addProductToWishList(String productid);
  removeProductFromWishList({required String productId, required String uid});
  removeAllWishList();
}
