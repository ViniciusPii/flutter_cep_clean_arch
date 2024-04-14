import 'package:flutter_arch/src/data/data_sources/address_data_source.dart';
import 'package:flutter_arch/src/data/repositories/address_repository.dart';
import 'package:flutter_arch/src/domain/entities/address_entity.dart';

class AddressRepositoryImpl implements AddressRepository {
  AddressRepositoryImpl({required AddressDataSource addressDataSource})
      : _addressDataSource = addressDataSource;

  final AddressDataSource _addressDataSource;

  @override
  Future<AddressEntity> getAddress(String cep) async => await _addressDataSource.getAddress(cep);
}
