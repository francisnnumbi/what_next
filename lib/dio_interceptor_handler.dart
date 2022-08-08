import 'package:dio/dio.dart';

class DioInterceptorHandler {
  static final Dio _dio = Dio();
  static Dio initDio() {
    return _dio
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) =>
                  _requestInterceptor(options, handler),
          onResponse: (Response response, ResponseInterceptorHandler handler) =>
              _responseInterceptor(response, handler),
          onError: (DioError error, ErrorInterceptorHandler handler) =>
              _errorInterceptor(error, handler),
        ),
      );
  }

  void clearInterceptor() {
    _dio.interceptors.clear();
  }

  static void _requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // handle request options where necessary
  }

  static void _responseInterceptor(
      Response response, ResponseInterceptorHandler handler) async {
    // handle request response where necessary
  }

  static void _errorInterceptor(
      DioError error, ErrorInterceptorHandler handler) async {
    // handle Dio error here where necessary using if...else or switch to handle each error case
    if (error.response!.statusCode == 404) {
      //show a toast
    }
    if (error.message.contains("KIEKIEKIE")) {
      // show a toast for that
    }
  }
}
