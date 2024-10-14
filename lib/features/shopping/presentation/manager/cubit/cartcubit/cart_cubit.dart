import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/shopping/data/models/cart_model.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cartcubitstate.dart';

class CartCubit extends Cubit<Cartcubitstate> {
  CartCubit() : super(CartInitialState());

  final Map<String, CartModel> _cartItem = {};
  Map<String, CartModel> get cartItem => _cartItem;
  void addProductToCart(
      {required String productId,
      required int quantity,
      required ProductModel productmodel}) {
    _cartItem.putIfAbsent(
      productId,
      () => CartModel(
          productModel: productmodel,
          id: DateTime.now().toString(),
          productId: productId,
          quantity: quantity),
    );
    emit(ProductAddedToCartSucessfully());
  }

  void increaseQuantityByOne({required ProductModel productModel}) {
    _cartItem.update(
      productModel.id,
      (value) => CartModel(
        id: value.id,
        productId: productModel.id,
        quantity: value.quantity + 1,
        productModel: productModel,
      ),
    );
    emit(IncreaseQuantityByOne());
  }

  void decreaseQuantityByOne(
      {required String productId, required ProductModel productModel}) {
    _cartItem.update(
      productId,
      (value) => CartModel(
        id: value.id,
        productId: productId,
        quantity: value.quantity - 1,
        productModel: productModel,
      ),
    );
    emit(DeacreseQuantityByOne());
  }

  void removeCartItem({required String productId}) {
    _cartItem.remove(productId);
    emit(RemoveCartItem());
  }

  void deleteAllCartItem() {
    _cartItem.clear();
    emit(DeleteAllCartItem());
  }
}
