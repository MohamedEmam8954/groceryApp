import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/profile/data/models/viewed_model.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/viewedProductcubit/viewed_product_state.dart';

class ViewedProductCubit extends Cubit<ViewedProductState> {
  ViewedProductCubit() : super(InitialViewdProduct());
  final Map<String, ViewedProductModel> _viewedListitems = {};
  Map<String, ViewedProductModel> get getViewListItems => _viewedListitems;
  addProductToHistory({required String productid}) {
    _viewedListitems.putIfAbsent(
      productid,
      () => ViewedProductModel(
          id: DateTime.now().toString(), productId: productid),
    );
    emit(SucessfullyAddProductToHistory());
  }

  clearHistory() {
    _viewedListitems.clear();
    emit(ClearAllHistory());
  }
}
