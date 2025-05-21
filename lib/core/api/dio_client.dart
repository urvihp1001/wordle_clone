import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class DioClient{
  static Dio getDio(){
    var dio=Dio();
    dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: false,
      ),
    );
    return dio;
  }
}