import 'package:bloc/bloc.dart';
import 'package:flutter_arch/src/core/app_exceptions.dart';
import 'package:flutter_arch/src/domain/use_cases/get_address_use_case.dart';

import '/src/presentation/home/controller/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetAddressUseCase getAddressUseCase,
  })  : _getAddressUseCase = getAddressUseCase,
        super(const HomeStateInitial());

  final GetAddressUseCase _getAddressUseCase;

  Future<void> getAddress(String cep) async {
    emit(const HomeStateLoading());
    try {
      final address = await _getAddressUseCase(cep);
      emit(HomeStateSuccess(address: address));
    } on AppGenericException catch (e) {
      emit(HomeStateError(message: e.message, isNetworError: false));
    } on AppNetworkException catch (e) {
      emit(HomeStateError(message: e.message, isNetworError: true));
    }
  }
}
