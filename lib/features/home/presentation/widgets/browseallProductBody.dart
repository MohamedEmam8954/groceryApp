import 'package:flutter/material.dart';
import 'package:grocery/features/home/presentation/widgets/allProductGridView.dart';

class BrowseAllProductBody extends StatefulWidget {
  const BrowseAllProductBody({super.key});

  @override
  State<BrowseAllProductBody> createState() => _BrowseAllProductBodyState();
}

class _BrowseAllProductBodyState extends State<BrowseAllProductBody> {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
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
          const AllProductGridView(),
        ],
      ),
    );
  }
}
