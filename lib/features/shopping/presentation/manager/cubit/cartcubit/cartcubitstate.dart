abstract class Cartstate {}

class CartInitialState extends Cartstate {}

class CartLoadingState extends Cartstate {}

class CartLoadedState extends Cartstate {}

class LoadingToAddProductToCart extends Cartstate {
  final String productId; // For product-specific loading
  LoadingToAddProductToCart({required this.productId});
}

class ProductAddedToCartSuccessfully extends Cartstate {
  final String productId; // For product-specific addition success
  ProductAddedToCartSuccessfully({required this.productId});
}

class IncreaseQuantityByOne extends Cartstate {
  final String
      productId; // For identifying the product whose quantity increased
  IncreaseQuantityByOne({required this.productId});
}

class DecreaseQuantityByOne extends Cartstate {
  final String
      productId; // For identifying the product whose quantity decreased
  DecreaseQuantityByOne({required this.productId});
}

class RemoveCartItem extends Cartstate {
  final String productId; // For identifying the removed product
  RemoveCartItem({required this.productId});
}

class LoadingToRemoveCartItem extends Cartstate {
  final String productId;
  LoadingToRemoveCartItem({required this.productId});
}

class DeleteAllCartItem extends Cartstate {}

class CartErrorState extends Cartstate {
  final String error; // Error message for failures
  CartErrorState({required this.error});
}
