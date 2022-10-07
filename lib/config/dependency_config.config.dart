// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import "package:cloud_functions/cloud_functions.dart" as _i4;
import "package:get_it/get_it.dart" as _i1;
import "package:injectable/injectable.dart" as _i2;

import "../repositories/user_repository.dart"
    as _i3; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.UserRepository>(
      () => _i3.UserRepository(get<_i4.FirebaseFunctions>()));
  return get;
}
