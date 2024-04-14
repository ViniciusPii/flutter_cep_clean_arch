import 'package:flutter_arch/src/domain/entities/address_entity.dart';

extension AddressAdapter on AddressEntity {
  static AddressEntity convert(Map<String, dynamic> json) {
    return AddressEntity(
      cep: json['cep'],
      city: json['localidade'],
      street: json['logradouro'],
    );
  }
}
