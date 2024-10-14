class ProductModel {
  final String title, id, imgUrl, productCategoryName;
  final double price, salePrice;
  final bool isOnsale, isPiece;
  ProductModel({
    required this.title,
    required this.id,
    required this.imgUrl,
    required this.productCategoryName,
    required this.price,
    required this.salePrice,
    required this.isOnsale,
    required this.isPiece,
  });
}
