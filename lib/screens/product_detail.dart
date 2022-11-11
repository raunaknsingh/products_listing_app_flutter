import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../model/products_model.dart';
import '../services/api_handler.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.productId}) : super(key: key);
  final int productId;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  ProductsModel? productModelProvider;
  bool isError = false;
  String errorMessage = "";

  Future<void> getProductInfo() async {
    try {
      productModelProvider = await ApiHandler.getProductModel(
        productId: widget.productId.toString(),
      );
    } catch (error) {
      isError = true;
      errorMessage = error.toString();
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() async {
    // await ApiHandler.getProductModel(widget.productId.toString());
    // setState(() {});
    getProductInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // ProductsModel? productModelProvider = Provider.of<ProductsModel>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Product Detail',
        ),
      ),
      body: isError
          ? Center(
              child: Center(
                child: Text(errorMessage),
              ),
            )
          : productModelProvider == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            productModelProvider!.category!.name!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productModelProvider!.title!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '\$',
                                style: const TextStyle(
                                    color: Colors.green, fontSize: 22),
                                children: [
                                  TextSpan(
                                    text:
                                        productModelProvider!.price!.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.25,
                        child: Swiper(
                          itemCount: productModelProvider!.images!.length,
                          itemBuilder: (context, index) {
                            return FancyShimmerImage(
                              imageUrl: productModelProvider!.images![index],
                            );
                          },
                          autoplay: true,
                          pagination: const SwiperPagination(
                              builder: DotSwiperPaginationBuilder(
                                  activeColor: Colors.red,
                                  color: Colors.white)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Description',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          productModelProvider!.description!,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
