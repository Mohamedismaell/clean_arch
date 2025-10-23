import 'package:clean_arch/core/database/api/end_points.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.baseUrl = EndPoints.baseUrl;

    super.onRequest(options, handler);
  }
}
