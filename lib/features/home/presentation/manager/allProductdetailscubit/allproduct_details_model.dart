import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/all_product_state.dart';

class AllProductDetailsCubit extends Cubit<AllProductState> {
  AllProductDetailsCubit() : super(AllproductInitial());
  static final List<ProductModel> _productmodel = [
    ProductModel(
        title: "Apricot",
        id: "3",
        imgUrl: Assets.assetsImagesCatFruits,
        productCategoryName: "Herbs",
        price: 0.99,
        salePrice: 0.35,
        isOnsale: true,
        isPiece: false),
    ProductModel(
        title: "Aprico",
        id: "1",
        imgUrl: Assets.assetsImagesCatGrains,
        productCategoryName: "fruits",
        price: 0.99,
        salePrice: 0.35,
        isOnsale: true,
        isPiece: false),
    ProductModel(
        title: "Apricot",
        id: "2",
        imgUrl: Assets.assetsImagesCatFruits,
        productCategoryName: "fruits",
        price: 0.5,
        salePrice: 0.35,
        isOnsale: false,
        isPiece: false),
  ];
  List<ProductModel> get productModel => _productmodel;
  List<ProductModel> get productOnSale =>
      _productmodel.where((element) => element.isOnsale).toList();
  List<ProductModel> findByCategory(String productCategory) {
    return _productmodel
        .where((element) => element.productCategoryName
            .toLowerCase()
            .contains(productCategory.toLowerCase()))
        .toList();
  }

  ProductModel findByIdFun({required String productId}) {
    return _productmodel.firstWhere((element) => element.id == productId);
  }
}
