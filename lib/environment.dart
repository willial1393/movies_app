class _Env {
  late String endpoint;
  late String token;

  _Env() {
    endpoint = _validateEnv(
      const String.fromEnvironment('ENDPOINT'),
      'ENDPOINT',
    );
    token = _validateEnv(
      const String.fromEnvironment('TOKEN'),
      'TOKEN',
    );
  }
}

String _validateEnv(String value, String key) {
  if (value.isEmpty) {
    throw Exception('MISSING ENVIRONMENT VARIABLE: $key');
  }
  return value;
}

final env = _Env();
