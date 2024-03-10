import 'package:flutter_arch/src/core/app_exceptions.dart';
import 'package:flutter_arch/src/data/repositories/address_repository.dart';
import 'package:flutter_arch/src/domain/entities/address_entity.dart';
import 'package:flutter_arch/src/domain/use_cases/get_address_use_case.dart';

class GetAddressUseCaseImpl implements GetAddressUseCase {
  GetAddressUseCaseImpl({required AddressRepository addressRepository})
      : _addressRepository = addressRepository;

  final AddressRepository _addressRepository;

  @override
  Future<AddressEntity> call(String cep) {
    try {
      return _addressRepository.getAddress(cep);
    } on AppGenericException catch (e) {
      throw AppGenericException(message: e.message);
    } on AppNetworkException catch (e) {
      throw AppNetworkException(message: e.message);
    }
  }
}
