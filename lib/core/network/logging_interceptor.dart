import 'package:dio/dio.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  int maxCharactersPerLine = 200;

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('*** Request ***');
    print('URI: ${options.uri}');
    print('Method: ${options.method}');
    print('Headers: ${options.headers}');
    print('Data: ${options.data}');
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    String responseAsString = response.data.toString();
    print('*** Response ***');
    print('Status Code: ${response.statusCode}');
    print('Data: ${response.data}');
    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
      }
    } else {
      print(response.data);
    }
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    print(
        "ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    return super.onError(err, handler);
  }
}
