import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/environment.dart';

@Injectable()
class TmdbApi {
  late Dio _dio;

  TmdbApi() {
    _dio = Dio(
      BaseOptions(
        baseUrl: env.endpoint,
        headers: {'Authorization': 'Bearer ${env.token}'},
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
  }

  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    if (response.statusCode != 200) {
      throw Exception(response.data);
    }
    return response.data;
  }
}
