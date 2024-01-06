import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/app/providers/app_provider.dart';
import 'package:movies_app/app/router/router.dart';
import 'package:movies_app/app/theme/colors.dart';
import 'package:movies_app/app/types/language.dart';
import 'package:movies_app/gen/assets.gen.dart';

class EMenu extends ConsumerWidget {
  const EMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final app = ref.watch(appProvider);
    return Drawer(
      backgroundColor: EColor.white,
      elevation: 0,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Assets.logo.image(width: 0.3.sw),
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
              SizedBox(height: 10.h),
              Row(
                children: [
                  const Text('Películas adultos'),
                  const Spacer(),
                  Switch(
                    activeColor: EColor.orange,
                    inactiveThumbColor: EColor.silver,
                    value: app.includeAdult,
                    onChanged: (value) async {
                      await ref
                          .read(appProvider.notifier)
                          .setIncludeAdult(value);
                    },
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              ElevatedButton(
                onPressed: () async {
                  await appRouter.push(const MovieSavedRoute());
                },
                child: const Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('Ver películas guardadas'),
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
