import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapigetx/screens/products/products_binding.dart';
import 'package:restapigetx/screens/products/view/products_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ProductsBinding(),
      home: const ProductsPage(),
    ),
  );
}

