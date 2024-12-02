import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/all_product_state.dart';
import 'package:grocery/features/home/repo/home_repo.dart';

class AllProductDetailsCubit extends Cubit<AllProductState> {
  AllProductDetailsCubit(this.homeRepo) : super(AllproductInitial());

  final HomeRepo homeRepo;
  List<ProductModel> _productModel = [];
  List<ProductModel> productAfterSearch = [];
  StreamSubscription? _streamSubscription;

  fetchData() {
    emit(LoadingToFetchData());

    _streamSubscription?.cancel();

    final data = homeRepo.fetchData();

    data.fold(
      (failure) {
        emit(FailuresToFetchData(errorMessage: failure.errormessage));
      },
      (stream) {
        _streamSubscription = stream.listen(
          (snapshot) {
            try {
              final products = snapshot.docs
                  .map((doc) => ProductModel.fromFirebase(doc))
                  .toList();

              _productModel = products;
              emit(SucessToFetchData(productModel: products));
            } catch (e) {
              emit(FailuresToFetchData(
                errorMessage: "Error parsing data: ${e.toString()}",
              ));
            }
          },
          onError: (error) {
            emit(FailuresToFetchData(errorMessage: error.toString()));
          },
        );
      },
    );
  }

  List<ProductModel> get productModel => _productModel;

  List<ProductModel> get productOnSale =>
      _productModel.where((element) => element.isOnsale).toList();

  List<ProductModel> findByCategory(String productCategory) {
    final lowercasedCategory = productCategory.toLowerCase();
    return _productModel
        .where((element) => element.productCategoryName
            .toLowerCase()
            .contains(lowercasedCategory))
        .toList();
  }

  ProductModel findByIdFun({required String productId}) {
    return _productModel.firstWhere((element) => element.id == productId);
  }

  searchByProductName(String nameOfProduct) {
    emit(LoadingproductAfterSearch());

    productAfterSearch = _productModel
        .where(
          (element) =>
              element.title.toLowerCase().contains(nameOfProduct.toLowerCase()),
        )
        .toList();

    if (productAfterSearch.isEmpty) {
      emit(FailuresproductAfterSearch(
        errorMessage: "No products found. Please try searching again.",
      ));
    } else {
      emit(SucessproductAfterSearch(productModel: productAfterSearch));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
