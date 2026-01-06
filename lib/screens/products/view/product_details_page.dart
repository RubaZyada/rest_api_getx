import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapigetx/screens/products/view/products_page.dart';
import '../controller/products_controller.dart';


class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: GetBuilder<ProductsController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];

              return ListTile(
                leading: Image.network(
                  product.image, 
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(product.title), 
                subtitle: Text('\$${product.price}'), 
                onTap: () {
                  Get.to(
                    () => ProductDetailsPage(product: product), 
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
