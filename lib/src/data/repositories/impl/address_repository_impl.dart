import 'package:flutter_arch/src/core/errors/app_exceptions.dart';
import 'package:flutter_arch/src/data/data_sources/address_data_source.dart';
import 'package:flutter_arch/src/data/repositories/address_repository.dart';
import 'package:flutter_arch/src/domain/entities/address_entity.dart';

class AddressRepositoryImpl implements AddressRepository {
  AddressRepositoryImpl({required AddressDataSource addressDataSource})
      : _addressDataSource = addressDataSource;

  final AddressDataSource _addressDataSource;

  @override
  Future<AddressEntity> getAddress(String cep) async {
    try {
      return await _addressDataSource.getAddress(cep);
    } on AppMessageException catch (e) {
      throw AppMessageException(message: e.message);
    } on AppNetworkMessageException catch (e) {
      throw AppNetworkMessageException(message: e.message);
    }
  }
}
