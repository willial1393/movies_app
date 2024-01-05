import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:movies_app/app/theme/colors.dart';

Duration ssNotificationDuration = const Duration(seconds: 3);

abstract class ENotification {
  static void setDuration(Duration duration) {
    ssNotificationDuration = duration;
  }

  static void error(String message) {
    show(
      text: message,
      backgroundColor: EColor.red,
      icon: Icons.error_rounded,
      foregroundColor: EColor.white,
    );
  }

  static void warning(String message) {
    show(
      text: message,
      backgroundColor: EColor.orange,
      icon: Icons.warning_rounded,
      foregroundColor: EColor.silver,
    );
  }

  static void info(String message) {
    show(
      text: message,
      backgroundColor: EColor.blue,
      icon: Icons.info_rounded,
      foregroundColor: EColor.silver,
    );
  }

  static void success(String message) {
    show(
      text: message,
      backgroundColor: EColor.green,
      icon: Icons.check_circle_rounded,
      foregroundColor: EColor.silver,
    );
  }

  static void show({
    String? text,
    Widget? content,
    Color? backgroundColor,
    Color? foregroundColor,
    IconData? icon,
    double? height,
  }) {
    final minHeight = height ?? 80.h;
    unawaited(
      SmartDialog.showToast(
        '',
        displayTime: ssNotificationDuration,
        animationTime: Duration.zero,
        builder: (context) {
          return Container(
            width: 1.sw,
            height: minHeight,
            padding: EdgeInsets.only(bottom: 20.h),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(8.w),
                width: double.infinity,
                height: minHeight,
                decoration: BoxDecoration(
                  color: (backgroundColor ?? EColor.white).withOpacity(0.95),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: content ??
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (icon != null)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                ),
                                child: Icon(
                                  icon,
                                  color: foregroundColor ?? EColor.silver,
                                  size: 30.h,
                                ),
                              ),
                            if (text != null)
                              Expanded(
                                child: Text(
                                  text,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: foregroundColor ?? EColor.silver,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
