import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/all_product_state.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/presentation/widgets/allProductGridView.dart';

class BrowseAllProductBody extends StatefulWidget {
  const BrowseAllProductBody({super.key, required this.productModel});
  final List<ProductModel> productModel;

  @override
  State<BrowseAllProductBody> createState() => _BrowseAllProductBodyState();
}

class _BrowseAllProductBodyState extends State<BrowseAllProductBody> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var productCubit = context.read<AllProductDetailsCubit>();

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Focus(
              focusNode: focusNode,
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  productCubit.searchByProductName(value);
                },
                decoration: InputDecoration(
                  hintText: "What's Your In Mind?",
                  prefixIcon: const Icon(Icons.search, size: 26),
                  suffixIcon: focusNode.hasFocus
                      ? IconButton(
                          onPressed: () {
                            controller.clear();
                            focusNode.unfocus();
                            productCubit
                                .searchByProductName(""); // Reset search
                          },
                          icon: const Icon(Icons.close, color: Colors.red),
                        )
                      : null,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<AllProductDetailsCubit, AllProductState>(
            builder: (context, state) {
              if (controller.text.isNotEmpty) {
                if (state is SucessproductAfterSearch) {
                  return AllProductGridView(productModel: state.productModel);
                } else if (state is FailuresproductAfterSearch) {
                  return Column(children: [
                    const Icon(Icons.search_off, size: 100, color: Colors.grey),
                    const SizedBox(height: 20),
                    Text(
                      state.errorMessage,
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ]);
                }
                return const Center(child: CircularProgressIndicator());
              }
              return AllProductGridView(productModel: widget.productModel);
            },
          ),
        ],
      ),
    );
  }
}
