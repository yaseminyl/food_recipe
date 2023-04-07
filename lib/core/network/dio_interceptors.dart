import 'package:dio/dio.dart';

class CustomInterceptors extends Interceptor {
  final Dio dio = Dio();

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // refresh token
    } else {
      return handler.next(err);
    }
    return super.onError(err, handler);
  }

  @override
  Future onRequest(RequestOptions options, handler) async {
    String token = '';
    if (token != '') {
      options.headers["Authorization"] = "Bearer $token";
      options.headers["Accept"] = "application/json";
      handler.next(options);
    } else {
      options.headers["Accept"] = "application/json";
      handler.next(options);
    }
  }
}
