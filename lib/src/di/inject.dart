import 'package:flutter_arch/src/data/data_sources/address_data_source.dart';
import 'package:flutter_arch/src/data/data_sources/impl/address_data_source_impl.dart';
import 'package:flutter_arch/src/data/repositories/address_repository.dart';
import 'package:flutter_arch/src/data/repositories/impl/address_repository_impl.dart';
import 'package:flutter_arch/src/domain/use_cases/get_address_use_case.dart';
import 'package:flutter_arch/src/domain/use_cases/impl/get_address_use_case_impl.dart';
import 'package:flutter_arch/src/external/http_service.dart';
import 'package:flutter_arch/src/external/impl/dio_http_service_impl.dart';
import 'package:flutter_arch/src/presentation/home/controller/home_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class Inject {
  static initialize() {
    //services
    getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImpl());

    //datasources
    getIt.registerLazySingleton<AddressDataSource>(
      () => AddressDataSourceImpl(http: getIt.get()),
    );

    //repositories
    getIt.registerLazySingleton<AddressRepository>(
      () => AddressRepositoryImpl(addressDataSource: getIt.get()),
    );

    //usecases
    getIt.registerLazySingleton<GetAddressUseCase>(
      () => GetAddressUseCaseImpl(addressRepository: getIt.get()),
    );

    //controllers
    getIt.registerLazySingleton<HomeCubit>(
      () => HomeCubit(getAddressUseCase: getIt.get()),
    );
  }
}
