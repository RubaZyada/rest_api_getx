import 'package:get/get.dart';
import '../model/product_model.dart';
import '../service/products_service.dart';

class ProductsController extends GetxController {
  final ProductsService service;

  ProductsController(this.service);

  bool isLoading = false;
  String? error;

  List<ProductModel> products = [];
  ProductModel? selectedProduct;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts() async {
    isLoading = true;
    update();

    final result = await service.fetchProducts();

    result.when(
      onSuccess: (data) {
        products = (data as List).map((e) => ProductModel.fromJson(e)).toList();
      },
      onError: (err) {
        error = err.errorMessage;
      },
    );

    isLoading = false;
    update();
  }

  // Future<void> loadDetails(int id) async {
  //   isLoading = true;
  //   update();

  //   final result = await service.fetchProductDetails(id);

  //   result.when(
  //     onSuccess: (data) {
  //       selectedProduct = ProductModel.fromJson(data);
  //     },
  //     onError: (err) {
  //       error = err.errorMessage;
  //     },
  //   );

  //   isLoading = false;
  //   update();
  // }
}
