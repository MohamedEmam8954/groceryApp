import 'package:grocery/features/home/data/model/product_model.dart';

class AllProductState {}

class AllproductInitial extends AllProductState {}

class LoadingToFetchData extends AllProductState {}

class SucessToFetchData extends AllProductState {
  final List<ProductModel> productModel;

  SucessToFetchData({required this.productModel});
}

class FailuresToFetchData extends AllProductState {
  final String errorMessage;

  FailuresToFetchData({required this.errorMessage});
}
//! productAfterSearch

class LoadingproductAfterSearch extends AllProductState {}

class SucessproductAfterSearch extends AllProductState {
  final List<ProductModel> productModel;

  SucessproductAfterSearch({required this.productModel});
}

class FailuresproductAfterSearch extends AllProductState {
  final String errorMessage;

  FailuresproductAfterSearch({required this.errorMessage});
}
