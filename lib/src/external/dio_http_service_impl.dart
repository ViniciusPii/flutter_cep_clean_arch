import 'package:dio/dio.dart';
import 'package:flutter_arch/src/core/errors/app_exceptions.dart';
import 'package:flutter_arch/src/core/external/app_client_response.dart';
import 'package:flutter_arch/src/core/external/http_service.dart';
import 'package:flutter_arch/src/external/interceptors/logging_interceptor.dart';

class DioHttpServiceImpl implements HttpService {
  DioHttpServiceImpl() {
    _dio = Dio(BaseOptions(baseUrl: 'https://viacep.com.br/ws'));
    _dio.interceptors.add(LoggingInterceptor());
  }

  late final Dio _dio;

  @override
  Future<AppClientResponse<T>> get<T>(String path) async {
    try {
      final response = await _dio.get(path);

      final AppClientResponse<T> appCLientResponse = AppClientResponse(
        data: response.data,
        message: response.statusMessage,
        statusCode: response.statusCode,
      );

      return appCLientResponse;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw AppNetworkException();
      }

      throw AppGenericException();
    }
  }
}
