import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/repo/home_repo.dart';
import 'package:grocery/features/shopping/data/models/cart_model.dart';
import 'package:grocery/features/shopping/data/repo/cart_repo.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cartcubitstate.dart';

class CartCubit extends Cubit<Cartstate> {
  CartCubit({required this.homeRepo, required this.cartRepo})
      : super(CartInitialState());

  final HomeRepo homeRepo;
  final CartRepo cartRepo;
  final Map<String, CartModel> _cartItem = {};
  Map<String, CartModel> get cartItem => _cartItem;

  Future<void> fetchDatafromCart() async {
    emit(CartLoadingState());
    try {
      final getData = await fetchFromCart();
      _cartItem.clear();
      for (var userCart in getData) {
        _cartItem.putIfAbsent(
          userCart["productid"],
          () => CartModel(
            id: userCart["uuid"],
            productId: userCart["productid"],
            quantity: int.parse(userCart["quantity"]),
          ),
        );
      }
      emit(CartLoadedState());
    } catch (e) {
      emit(CartErrorState(error: "Failed to load cart data: ${e.toString()}"));
    }
  }

  Future<void> uploadDataCartTofirebase({
    required String quantity,
    required String productid,
  }) async {
    emit(LoadingToAddProductToCart(productId: productid));
    try {
      await homeRepo.addProductToCart(quantity: quantity, productid: productid);
      await fetchDatafromCart();
      emit(ProductAddedToCartSuccessfully(productId: productid));
    } catch (e) {
      emit(CartErrorState(error: "Failed to add product: ${e.toString()}"));
    }
  }

  Future<List<dynamic>> fetchFromCart() async {
    var data = await homeRepo.fetchDataFromCart();
    return data.get("userCart") ?? [];
  }

  void increaseQuantityByOne({required String productId}) {
    final currentItem = _cartItem[productId];
    if (currentItem != null) {
      _cartItem.update(
        productId,
        (value) => CartModel(
          id: value.id,
          productId: productId,
          quantity: value.quantity + 1,
        ),
      );
      emit(IncreaseQuantityByOne(productId: productId));
    }
  }

  void decreaseQuantityByOne({required String productId}) {
    final currentItem = _cartItem[productId];
    if (currentItem != null && currentItem.quantity > 1) {
      _cartItem.update(
        productId,
        (value) => CartModel(
          id: value.id,
          productId: productId,
          quantity: value.quantity - 1,
        ),
      );
      emit(DecreaseQuantityByOne(productId: productId));
    }
  }

  Future<void> removeCartItem({required String productId}) async {
    emit(LoadingToRemoveCartItem(productId: productId));
    await Future.delayed(const Duration(seconds: 2), () {
      final removeItem = _cartItem.remove(productId);
      if (removeItem != null) {
        try {
          final Map<String, String> itemToRemove = {
            "productid": removeItem.productId,
            "quantity": removeItem.quantity.toString(),
            "uuid": removeItem.id,
          };

          cartRepo.removeItemFromCart(itemToRemove);
          emit(RemoveCartItem(
              productId: productId)); // Emit success state after removal
        } catch (e) {
          emit(CartErrorState(
            error: "Failed to remove product: ${e.toString()}",
          ));
        }
      }
    });
  }

  Future<void> deleteAllCartItems() async {
    _cartItem.clear();
    try {
      await cartRepo.removeAllItems();
      emit(DeleteAllCartItem());
    } catch (e) {
      emit(CartErrorState(
        error: "Failed to delete all items: ${e.toString()}",
      ));
    }
  }
}
