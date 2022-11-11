import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/category_model.dart';
import '../services/api_handler.dart';
import '../widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Categories Screen',
        ),
      ),
      body: FutureBuilder<List<CategoryModel>>(
        future: ApiHandler.getAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data == null) {
            return const Center(
              child: Text('No items to show'),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Some error occured'),
            );
          }
          return GridView.builder(
            itemCount: snapshot.data!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
            ),
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                value: snapshot.data![index],
                child: const CategoryWidget(),
              );
            },
          );
        },
      ),
    );
  }
}
