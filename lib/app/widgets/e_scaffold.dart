import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/app/providers/app_provider.dart';
import 'package:movies_app/app/theme/colors.dart';
import 'package:movies_app/app/types/language.dart';
import 'package:movies_app/gen/assets.gen.dart';

class EScaffold extends ConsumerWidget {
  final String title;
  final Widget body;

  const EScaffold({
    required this.title,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final app = ref.watch(appProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: EColor.orange,
      ),
      drawer: Drawer(
        backgroundColor: EColor.white,
        elevation: 0,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                Assets.logo.image(width: 0.2.sw),
                SizedBox(height: 30.h),
                DropdownButton<Language>(
                  isExpanded: true,
                  value: app.language,
                  onChanged: (Language? value) async {
                    if (value != null) {
                      await ref.read(appProvider.notifier).setLanguage(value);
                    }
                  },
                  items: Language.values.map((Language value) {
                    return DropdownMenuItem<Language>(
                      value: value,
                      child: Row(
                        children: [
                          Text(value.name),
                          const Spacer(),
                          if (value == Language.es)
                            Assets.icons.es.image(
                              height: 20.h,
                            ),
                          if (value == Language.en)
                            Assets.icons.en.image(
                              height: 20.h,
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(child: body),
    );
  }
}
