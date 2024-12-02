abstract class OrderRepo {
  Future<void> makeOrder(
      {required String productId,
      required String price,
      required String totalPrice,
      required String quantity,
      required String imgUrl,
      required String title});
  Future<List<dynamic>> getOrders({required String uid});
}
