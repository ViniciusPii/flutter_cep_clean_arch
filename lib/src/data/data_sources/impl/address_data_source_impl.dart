import 'package:flutter_arch/src/core/errors/app_exceptions.dart';
import 'package:flutter_arch/src/core/external/app_client_response.dart';
import 'package:flutter_arch/src/core/external/http_service.dart';
import 'package:flutter_arch/src/data/adapters/address_adapter.dart';
import 'package:flutter_arch/src/data/data_sources/address_data_source.dart';
import 'package:flutter_arch/src/domain/entities/address_entity.dart';

class AddressDataSourceImpl implements AddressDataSource {
  AddressDataSourceImpl({required HttpService http}) : _http = http;

  final HttpService _http;

  static String baseUrl(String cep) => '/$cep/json/';

  @override
  Future<AddressEntity> getAddress(String cep) async {
    try {
      final AppClientResponse response = await _http.get(baseUrl(cep));

      final data = response.data;

      if (response.statusCode == 200 && data['erro'] == true) {
        throw AppGenericMessageException(message: 'Cep não encontrado!');
      }

      return AddressAdapter.convert(data);
    } on AppNetworkException catch (_) {
      throw AppNetworkMessageException(message: 'Ops! Você está sem conexão!');
    } on AppGenericMessageException catch (e) {
      throw AppGenericMessageException(message: e.message);
    } catch (e) {
      throw AppGenericMessageException(message: 'Ops! Algo deu errado');
    }
  }
}
