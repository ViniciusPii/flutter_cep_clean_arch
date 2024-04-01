import 'package:flutter_arch/src/core/errors/app_exceptions.dart';
import 'package:flutter_arch/src/data/adapters/address_adapter.dart';
import 'package:flutter_arch/src/data/data_sources/address_data_source.dart';
import 'package:flutter_arch/src/domain/entities/address_entity.dart';
import 'package:flutter_arch/src/external/app_client_response.dart';
import 'package:flutter_arch/src/external/http_service.dart';

class AddressDataSourceImpl implements AddressDataSource {
  AddressDataSourceImpl({required HttpService http}) : _http = http;

  final HttpService _http;

  static String baseUrl(String cep) => '/$cep/json/';

  @override
  Future<AddressEntity> getAddress(String cep) async {
    try {
      final AppClientResponse response = await _http.get(baseUrl(cep));

      final data = response.data;

      return AddressAdapter.fromJson(data);
    } on AppNetworkMessageException catch (_) {
      throw AppNetworkMessageException(message: 'Ops! Você está sem conexão!');
    } catch (e) {
      throw AppMessageException(message: 'CEP não encontrado!');
    }
  }
}
