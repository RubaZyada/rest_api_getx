import 'package:restapigetx/core/networking/api_constants.dart';
import 'package:restapigetx/core/networking/api_error_handler.dart';
import 'package:restapigetx/core/networking/api_result.dart';
import 'package:restapigetx/core/networking/dio_factory.dart';



class ProductsService {
  Future<ApiResult<dynamic>> fetchProducts() async {
    try {
      final dio = DioFactory().dio;
      final response = await dio.get(ApiConstants.products);
      return ApiResult.success(response.data);
    } catch (e) {
      return ApiResult.error(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> fetchProductDetails(int id) async {
    try {
      final dio = DioFactory().dio;
      final response = await dio.get('${ApiConstants.products}/$id');
      return ApiResult.success(response.data);
    } catch (e) {
      return ApiResult.error(ApiErrorHandler.handle(e));
    }
  }
}
