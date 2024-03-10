import 'package:flutter_arch/src/core/app_exceptions.dart';
import 'package:flutter_arch/src/data/adapters/address_adapter.dart';
import 'package:flutter_arch/src/data/data_sources/address_data_source.dart';
import 'package:flutter_arch/src/domain/entities/address_entity.dart';
import 'package:flutter_arch/src/external/http_service.dart';

class AddressDataSourceImpl implements AddressDataSource {
  AddressDataSourceImpl({required HttpService http}) : _http = http;

  final HttpService _http;

  static String baseUrl(String cep) => '/$cep/json/';

  @override
  Future<AddressEntity> getAddress(String cep) async {
    try {
      final response = await _http.get(baseUrl(cep));

      final data = response.data;

      return AddressAdapter.fromJson(data);
    } on AppNetworkException catch (e) {
      throw AppNetworkException(message: e.message);
    } catch (e) {
      throw AppGenericException(message: 'CEP não encontrado!');
    }
  }
}
