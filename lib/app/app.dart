import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:movies_app/app/router/router.dart';
import 'package:movies_app/app/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: appRouter.config(
          navigatorObservers: () => [
            FlutterSmartDialog.observer,
          ],
        ),
        builder: FlutterSmartDialog.init(),
      ),
    );
  }
}
