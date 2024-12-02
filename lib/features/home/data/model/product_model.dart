class ProductModel {
  final String title, price, id, imgUrl, productCategoryName, quantity;
  final num salePrice;
  final bool isOnsale;
  final num isPiece;

  ProductModel(
      {required this.title,
      required this.id,
      required this.imgUrl,
      required this.productCategoryName,
      required this.price,
      required this.salePrice,
      required this.isOnsale,
      required this.isPiece,
      required this.quantity});

  factory ProductModel.fromFirebase(fromFirebase) {
    return ProductModel(
      title: fromFirebase["productTitle"],
      id: fromFirebase["id"],
      imgUrl: fromFirebase["imgUrl"],
      productCategoryName: fromFirebase["productCategory"],
      price: fromFirebase["price"],
      salePrice: fromFirebase["priceAfterSale"],
      isOnsale: fromFirebase["isonsale"],
      isPiece: fromFirebase["isPiece"],
      quantity: fromFirebase["quantity"],
    );
  }
}
