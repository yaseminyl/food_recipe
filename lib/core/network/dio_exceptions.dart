import 'dart:io';
import 'package:dio/dio.dart';
import 'package:food_recipe/core/constants/enum/exception_type.dart';
import 'package:food_recipe/core/network/exceptions.dart';

AppException handleException(error) {
  if (error is Exception) {
    try {
      AppException exception = AppException(ExceptionType.unknownError.message);
      if (error is DioError) {
        switch (error.type) {
          //CANCEL
          case DioErrorType.cancel:
            exception = AppException(
              ExceptionType.requestCancelled.message,
            );
            break;
          //CONNECT TIMEOUT
          case DioErrorType.connectTimeout:
            exception = AppException(
              ExceptionType.requestTimeout.message,
            );
            break;
          //RECEIVE TIMEOUT
          case DioErrorType.receiveTimeout:
            exception = AppException(
              ExceptionType.timeout.message,
            );
            break;
          //RESPONSE
          case DioErrorType.response:
            exception = AppException(
              error.response?.data['error']['errors'].first,
            );
            break;
          case DioErrorType.sendTimeout:
            exception = AppException(ExceptionType.timeout.message);
            break;
          case DioErrorType.other:
            if (error.toString().contains('SocketException')) {
              // NO INTERNET CONNECTION
              exception = AppException(
                ExceptionType.noInternetConnection.message,
              );
              break;
            } else {
              // UNKNOWN ERROR
              exception = AppException(
                ExceptionType.unknownError.message,
              );
              break;
            }
        }
      } else if (error is SocketException) {
        exception = AppException(
          ExceptionType.noInternetConnection.message,
        );
      } else {
        exception = AppException(
          ExceptionType.unknownError.message,
        );
      }
      return exception;
    } catch (_) {
      return AppException(
        ExceptionType.unknownError.message,
      );
    }
  } else {
    return AppException(
      ExceptionType.unknownError.message,
    );
  }
}
