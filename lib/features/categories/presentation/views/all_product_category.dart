import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/customAppBar.dart';
import 'package:grocery/features/categories/data/model/categoryViewItemmodel.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/presentation/widgets/groceryproductwidget.dart';
import 'package:grocery/features/home/presentation/widgets/noProductSale.dart';

class AllProductCategory extends StatelessWidget {
  const AllProductCategory({super.key, required this.categoryViewItemModel});
  final CategoryViewItemModel categoryViewItemModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: AppStrings.allProducts),
        body: BlocProvider(
          create: (context) => AllProductDetailsCubit(),
          child: AllProductCategoryBody(
            categoryViewItemModel: categoryViewItemModel,
          ),
        ),
      ),
    );
  }
}

class AllProductCategoryBody extends StatelessWidget {
  const AllProductCategoryBody(
      {super.key, required this.categoryViewItemModel});
  final CategoryViewItemModel categoryViewItemModel;

  @override
  Widget build(BuildContext context) {
    List<ProductModel> product = context
        .read<AllProductDetailsCubit>()
        .findByCategory(categoryViewItemModel.title);
    return SingleChildScrollView(
        child: product.isEmpty
            ? const NoProductYet(title: AppStrings.noProductNow)
            : ShowAllProduct(categoryViewItemModel: categoryViewItemModel));
  }
}

class ShowAllProduct extends StatefulWidget {
  const ShowAllProduct({super.key, required this.categoryViewItemModel});
  final CategoryViewItemModel categoryViewItemModel;

  @override
  State<ShowAllProduct> createState() => _ShowAllProductState();
}

class _ShowAllProductState extends State<ShowAllProduct> {
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 100.0,
            ),
            child: TextField(
              minLines: 1,
              maxLines: 5,
              controller: controller,
              focusNode: focusNode,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                hintText: "What's Your In Mind ?",
                prefixIcon: const Icon(
                  Icons.search,
                  size: 26,
                ),
                suffixIcon: focusNode.hasFocus
                    ? IconButton(
                        onPressed: () {
                          controller.clear();
                          focusNode.unfocus();
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ),
        AllProductCatGridView(
          categoryViewItemModel: widget.categoryViewItemModel,
        ),
      ],
    );
  }
}

class AllProductCatGridView extends StatelessWidget {
  const AllProductCatGridView({super.key, required this.categoryViewItemModel});
  final CategoryViewItemModel categoryViewItemModel;

  @override
  Widget build(BuildContext context) {
    List<ProductModel> product = context
        .read<AllProductDetailsCubit>()
        .findByCategory(categoryViewItemModel.title);

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      padding: EdgeInsets.zero,
      mainAxisSpacing: 10,
      crossAxisSpacing: 15,
      childAspectRatio: 35 / 50,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        product.length,
        (index) {
          return InkWell(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRouter.productDetails, extra: product[index]);
            },
            child: GroceryProductHome(
              productModel: product[index],
            ),
          );
        },
      ),
    );
  }
}
