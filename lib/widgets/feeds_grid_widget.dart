import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/products_model.dart';
import 'feeds_widget.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget({Key? key, required this.products}) : super(key: key);

  final List<ProductsModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 0.65),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
            value: products[index], child: const FeedsWidget());
      },
    );
  }
}
