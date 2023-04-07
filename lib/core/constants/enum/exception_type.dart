enum ExceptionType {
  requestCancelled,
  requestTimeout,
  noInternetConnection,
  timeout,
  badRequest,
  notFound,
  unknownError,
}

extension ExceptionTypeExtension on ExceptionType {
  String get message {
    switch (this) {
      case ExceptionType.requestCancelled:
        return ('İstek iptal edildi! ');

      case ExceptionType.requestTimeout:
        return ('İstek zamanaşımına uğradı!');

      case ExceptionType.noInternetConnection:
        return ('İnternet bağlantısı bulunamadı. Uygulamayı kullanabilmeniz için internete ihtiyacınız vardır!');

      case ExceptionType.timeout:
        return ('Zamanaşımı hatası. Lütfen daha sonra tekrar deneyiniz!');

      case ExceptionType.notFound:
        return ('Bulunamadı!');

      case ExceptionType.unknownError:
        return ('Bilinmeyen bir hata oluştu. Lütfen daha sonra tekrar deneyiniz!');

      case ExceptionType.badRequest:
        return ('Bulunamadı!');
    }
  }
}
