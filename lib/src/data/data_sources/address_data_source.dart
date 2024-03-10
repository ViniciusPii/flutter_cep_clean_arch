import 'package:flutter_arch/src/domain/entities/address_entity.dart';

abstract class AddressDataSource {
  Future<AddressEntity> getAddress(String cep);
}
