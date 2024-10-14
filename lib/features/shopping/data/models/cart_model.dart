import 'package:grocery/features/home/data/model/product_model.dart';

class CartModel {
  final String id, productId;
  final int quantity;
  final ProductModel? productModel;

  CartModel({
    required this.id,
    required this.productId,
    required this.quantity,
    this.productModel,
  });
}
