import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery/features/profile/data/repo/orderRepo/order_repo.dart';
import 'package:grocery/features/profile/data/models/order_model.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/orderCubit/order_cubit_state.dart';

class OrderCubit extends Cubit<OrderCubitState> {
  OrderCubit(this.orderRepo) : super(InitialOrderCubitState());
  static List<OrderModel> _orderList = [];
  List<OrderModel> get orderList => _orderList;
  OrderRepo orderRepo;
  Future<void> makeOrder(
      {required String productId,
      required String price,
      required String totalPrice,
      required String quantity,
      required String imgUrl,
      required String title}) async {
    emit(LoadingOrderCubitState());

    await orderRepo.makeOrder(
        productId: productId,
        price: price,
        totalPrice: totalPrice,
        quantity: quantity,
        imgUrl: imgUrl,
        title: title);

    emit(SucessOrderCubitState());
  }

  getOrders() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        emit(LoadingGettingOrderState());
        String uid = user.uid;
        List<dynamic> orders = await orderRepo.getOrders(uid: uid);
        _orderList.clear();
        for (var element in orders) {
          _orderList.insert(
            0,
            OrderModel.fromfB(element),
          );
        }
        emit(SucessGettingOrderState());
      } catch (e) {
        log("this Error From Getting Order ${e.toString()}");
        emit(FailureGettingOrderState(errorMessage: e.toString()));
      }
    }
  }

  removeAllOrders() {
    _orderList.clear();
  }
}
