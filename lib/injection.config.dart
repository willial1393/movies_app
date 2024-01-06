// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:movies_app/core/interfaces/movie_interface.dart' as _i6;
import 'package:movies_app/core/interfaces/storage_interface.dart' as _i3;
import 'package:movies_app/data/services/movie_service.dart' as _i7;
import 'package:movies_app/data/services/storage_service.dart' as _i4;
import 'package:movies_app/data/source/tmdb_api.dart' as _i5;

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
    gh.factory<_i3.StorageInterface>(() => _i4.StorageService());
    gh.factory<_i5.TmdbApi>(() => _i5.TmdbApi());
    gh.factory<_i6.MovieInterface>(
        () => _i7.MovieService(api: gh<_i5.TmdbApi>()));
    return this;
  }
}
