import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/app/providers/app_provider.dart';
import 'package:movies_app/app/router/router.dart';
import 'package:movies_app/app/widgets/e_loading.dart';
import 'package:movies_app/app/widgets/e_retry.dart';
import 'package:movies_app/core/interfaces/storage_interface.dart';
import 'package:movies_app/gen/assets.gen.dart';
import 'package:movies_app/injection.dart';

@RoutePage()
class ChargingScreen extends ConsumerStatefulWidget {
  const ChargingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ChargingScreen> createState() => _ChargingScreenState();
}

class _ChargingScreenState extends ConsumerState<ChargingScreen> {
  final StorageInterface storage = getIt<StorageInterface>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(fetchData());
    });
  }

  @override
  Widget build(BuildContext context) {
    final error = ref.watch(appProvider.select((value) => value.error));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.logo.image(width: 0.5.sw),
            SizedBox(height: 30.h),
            if (error)
              ERetry(onRetry: fetchData)
            else
              SizedBox(
                width: 0.8.sw,
                child: const ELoading(linear: true),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    await ref.read(appProvider.notifier).fetchGenres();
    final language = await storage.getLanguage();
    await ref.read(appProvider.notifier).setLanguage(language);
    await appRouter.pushAndPopUntil(
      const MovieListRoute(),
      predicate: (route) => true,
    );
  }
}
