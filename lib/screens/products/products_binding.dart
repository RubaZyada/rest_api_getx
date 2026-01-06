import 'package:get/get.dart';
import 'service/products_service.dart';
import 'controller/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductsService());
    Get.put(ProductsController(Get.find()));
  }
}
