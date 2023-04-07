import 'package:dio/dio.dart';
import 'package:food_recipe/core/network/dio_exceptions.dart';
import 'dio_interceptors.dart';

class NetworkDataManager {
  final Dio dio;

  NetworkDataManager(this.dio) {
    dio.interceptors.add(CustomInterceptors());
    dio.interceptors.add(LogInterceptor(responseBody: false));
  }

  Future<Response> get(String path, {queryParameters}) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
      );

      return response;
    } on DioError catch (err) {
      throw handleException(err.toString());
    }
  }

  Future<Response> post(String path, {data, queryParameters}) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (err) {
      throw handleException(err.toString());
    }
  }

  Future<Response> put(String path, {data}) async {
    try {
      final response = await dio.put(
        path,
        data: data,
      );
      return response;
    } on DioError catch (err) {
      throw handleException(err.toString());
    }
  }

  Future<Response> delete(String path, {data}) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
      );
      return response;
    } on DioError catch (err) {
      throw handleException(err.toString());
    }
  }
}
