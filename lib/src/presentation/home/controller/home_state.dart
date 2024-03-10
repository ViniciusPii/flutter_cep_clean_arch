import 'package:flutter_arch/src/domain/entities/address_entity.dart';

sealed class HomeState {
  const HomeState();
}

class HomeStateInitial extends HomeState {
  const HomeStateInitial();
}

class HomeStateLoading extends HomeState {
  const HomeStateLoading();
}

class HomeStateSuccess extends HomeState {
  const HomeStateSuccess({required this.address});

  final AddressEntity address;
}

class HomeStateError extends HomeState {
  const HomeStateError({required this.message, required this.isNetworError});

  final String message;
  final bool isNetworError;
}
