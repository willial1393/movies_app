// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_core/firebase_core.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:movies_app/app/modules/firebase_module.dart' as _i9;
import 'package:movies_app/core/interfaces/movie_interface.dart' as _i7;
import 'package:movies_app/core/interfaces/storage_interface.dart' as _i4;
import 'package:movies_app/data/services/movie_service.dart' as _i8;
import 'package:movies_app/data/services/storage_service.dart' as _i5;
import 'package:movies_app/data/source/tmdb_api.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    await gh.factoryAsync<_i3.FirebaseApp>(
      () => firebaseModule.init(),
      preResolve: true,
    );
    gh.factory<_i4.StorageInterface>(() => _i5.StorageService());
    gh.factory<_i6.TmdbApi>(() => _i6.TmdbApi());
    gh.factory<_i7.MovieInterface>(
        () => _i8.MovieService(api: gh<_i6.TmdbApi>()));
    return this;
  }
}

class _$FirebaseModule extends _i9.FirebaseModule {}
