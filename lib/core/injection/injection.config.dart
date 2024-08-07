// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:uhuru/config/app_config.dart' as _i7;
import 'package:uhuru/config/app_config_impl.dart' as _i8;
import 'package:uhuru/config/routes/app_router.dart' as _i6;
import 'package:uhuru/config/routes/auth_guard.dart' as _i13;
import 'package:uhuru/core/injection/register_module.dart' as _i15;
import 'package:uhuru/core/network/dio_client.dart' as _i4;
import 'package:uhuru/core/session/session_manager.dart' as _i11;
import 'package:uhuru/core/session/session_manager_impl.dart' as _i12;
import 'package:uhuru/features/auth/data/repository/auth_repository_impl.dart'
    as _i10;
import 'package:uhuru/features/auth/domain/repository/auth_repository.dart'
    as _i9;
import 'package:uhuru/features/auth/presentation/bloc/auth_bloc.dart' as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.GraphQLClient>(() => registerModule.client);
    gh.singleton<_i4.DioClient>(() => registerModule.dioClient);
    gh.singleton<_i5.FlutterSecureStorage>(
        () => registerModule.flutterSecureStorage);
    gh.singleton<_i6.AppRouter>(() => registerModule.appRouter);
    gh.factory<_i7.AppConfig>(() => _i8.AppConfigImpl());
    gh.factory<_i9.AuthRepository>(() => _i10.AuthRepositoryImpl(
          gh<_i4.DioClient>(),
          gh<_i3.GraphQLClient>(),
        ));
    gh.factory<_i11.SessionManager>(
        () => _i12.SessionManagerImpl(gh<_i5.FlutterSecureStorage>()));
    gh.factory<_i13.AuthGuard>(() => _i13.AuthGuard(gh<_i11.SessionManager>()));
    gh.factory<_i14.AuthBloc>(() => _i14.AuthBloc(
          gh<_i9.AuthRepository>(),
          gh<_i11.SessionManager>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i15.RegisterModule {}
