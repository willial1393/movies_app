// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:movies_app/core/interfaces/movie_interface.dart' as _i4;
import 'package:movies_app/data/services/movie_service.dart' as _i5;
import 'package:movies_app/data/source/tmdb_api.dart' as _i3;

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
    gh.factory<_i3.TmdbApi>(() => _i3.TmdbApi());
    gh.factory<_i4.MovieInterface>(
        () => _i5.MovieService(api: gh<_i3.TmdbApi>()));
    return this;
  }
}
