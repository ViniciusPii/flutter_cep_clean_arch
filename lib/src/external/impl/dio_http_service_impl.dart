import 'package:dio/dio.dart';
import 'package:flutter_arch/src/core/errors/app_exceptions.dart';
import 'package:flutter_arch/src/external/app_client_response.dart';
import 'package:flutter_arch/src/external/http_service.dart';

class DioHttpServiceImpl implements HttpService {
  DioHttpServiceImpl() {
    _dio = Dio(BaseOptions(baseUrl: 'https://viacep.com.br/ws'));
  }

  late final Dio _dio;

  @override
  Future<AppClientResponse<T>> get<T>(String path) async {
    try {
      final response = await _dio.get(path);
      return AppClientResponse(data: response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw AppNetworkException();
      }

      throw AppGenericException();
    }
  }
}
