import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseModule {
  @preResolve
  Future<FirebaseApp> init() async {
    final app = await Firebase.initializeApp();
    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: false,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
    await FirebaseFirestore.instance.disableNetwork();
    return app;
  }
}
