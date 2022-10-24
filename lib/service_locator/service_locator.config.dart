// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../feature/fact/fact_bloc.dart' as _i7;
import '../feature/history/history_bloc.dart' as _i6;
import '../network/api_client.dart' as _i4;
import '../network/network_module.dart' as _i8;
import '../repository/fact_repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.lazySingleton<_i3.Dio>(
      () => networkModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i4.ApiClient>(() => _i4.ApiClient(get<_i3.Dio>()));
  gh.factory<_i5.FactRepository>(
      () => _i5.FactRepository(client: get<_i4.ApiClient>()));
  gh.factory<_i6.HistoryBloc>(() => _i6.HistoryBloc(get<_i5.FactRepository>()));
  gh.factory<_i7.FactBloc>(() => _i7.FactBloc(get<_i5.FactRepository>()));
  return get;
}

class _$NetworkModule extends _i8.NetworkModule {}
