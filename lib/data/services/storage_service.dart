import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/app/types/language.dart';
import 'package:movies_app/core/interfaces/storage_interface.dart';

@Injectable(as: StorageInterface)
class StorageService implements StorageInterface {
  late FlutterSecureStorage _storage;

  StorageService() {
    _storage = const FlutterSecureStorage();
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
}
