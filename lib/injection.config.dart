// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart'
    as _i838;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart'
    as _i543;
import 'package:ecommerce_flutter/src/di/AppModule.dart' as _i987;
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart'
    as _i148;
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart'
    as _i322;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appmodule = _$Appmodule();
    gh.factory<_i543.AuthService>(() => appmodule.authService);
    gh.factory<_i838.SharePref>(() => appmodule.sharedPref);
    gh.factory<_i148.AuthRepository>(() => appmodule.authRepository);
    gh.factory<_i322.AuthUseCases>(() => appmodule.authUseCases);
    return this;
  }
}

class _$Appmodule extends _i987.Appmodule {}
