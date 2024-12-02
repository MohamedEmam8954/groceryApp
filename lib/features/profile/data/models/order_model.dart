import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String orderId, userId, productId, price, imgUrl, quauntity, title;
  final Timestamp orderDate;

  OrderModel(
      {required this.orderId,
      required this.userId,
      required this.productId,
      required this.price,
      required this.imgUrl,
      required this.quauntity,
      required this.orderDate,
      required this.title});

  factory OrderModel.fromfB(orders) {
    return OrderModel(
        orderId: orders["orderId"],
        userId: orders["userId"],
        productId: orders["productId"],
        price: orders["price"],
        imgUrl: orders["imgUrl"],
        quauntity: orders["quantity"],
        orderDate: orders["orderDate"],
        title: orders["title"]);
  }
}
