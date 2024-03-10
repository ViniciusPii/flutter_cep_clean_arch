import 'package:flutter_arch/src/domain/entities/address_entity.dart';

abstract class GetAddressUseCase {
  Future<AddressEntity> call(String cep);
}
