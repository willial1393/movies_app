import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/app/types/language.dart';
import 'package:movies_app/core/interfaces/storage_interface.dart';
import 'package:movies_app/core/models/movie_detail/movie_detail.dart';

@Injectable(as: StorageInterface)
class StorageService implements StorageInterface {
  late FlutterSecureStorage _storage;
  late CollectionReference<Map<String, dynamic>> movies;

  StorageService() {
    _storage = const FlutterSecureStorage();
    movies = FirebaseFirestore.instance.collection('movies');
  }

  @override
  Future<Language> getLanguage() async {
    final res = await _storage.read(key: 'language');
    if (res == null) {
      return Language.es;
    }
    return Language.values.firstWhere((element) => element.name == res);
  }

  @override
  Future<void> setLanguage(Language language) async {
    await _storage.write(key: 'language', value: language.name);
  }

  @override
  Future<bool> getIncludeAdult() async {
    final res = await _storage.read(key: 'includeAdult');
    if (res == null) {
      return false;
    }
    return res == 'true';
  }

  @override
  Future<void> setIncludeAdult(bool includeAdult) async {
    await _storage.write(key: 'includeAdult', value: includeAdult.toString());
  }

  @override
  void saveMovie(MovieDetail movie) {
    unawaited(movies.doc(movie.id.toString()).set(movie.toJson()));
  }

  @override
  void removeMovie(MovieDetail movie) {
    unawaited(movies.doc(movie.id.toString()).delete());
  }

  @override
  Future<List<MovieDetail>> getSavedMovies() async {
    final res = await movies.get();
    return res.docs.map((e) => MovieDetail.fromJson(e.data())).toList();
  }
}
