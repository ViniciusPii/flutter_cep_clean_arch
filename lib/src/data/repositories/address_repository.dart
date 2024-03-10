import 'package:flutter_arch/src/domain/entities/address_entity.dart';

abstract class AddressRepository {
  Future<AddressEntity> getAddress(String cep);
}
