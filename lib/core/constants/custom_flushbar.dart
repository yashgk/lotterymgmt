import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:lotto_mgmt/core/constants/constants.dart';

class CustomFlushbar {
  CustomFlushbar(
    BuildContext context,
    String message, {
    Color? textColor,
    Color? background,
    Widget? icon,
    FlushbarPosition? flushbarPosition,
    Duration duration = const Duration(seconds: 2),
  }) {
    Flushbar(
      flushbarPosition: flushbarPosition ?? FlushbarPosition.BOTTOM,
      duration: duration,
      icon: icon,
      backgroundColor: background ?? Colors.black,
      message: message,
      messageColor: AppColors.whiteColor,
      shouldIconPulse: false,
    ).show(context);
  }

  CustomFlushbar.error(
    BuildContext context,
    String message, {
    Widget? icon,
    Color? background,
    FlushbarPosition? flushbarPosition,
  }) {
    CustomFlushbar(
      context,
      message,
      background: AppColors.errorColor,
      icon: icon,
      flushbarPosition: flushbarPosition,
    );
  }

  CustomFlushbar.success(
    BuildContext context,
    String message, {
    Widget? icon,
    Color? background,
    FlushbarPosition? flushbarPosition,
  }) {
    CustomFlushbar(
      context,
      message,
      background: AppColors.successColor,
      icon: icon,
      flushbarPosition: flushbarPosition,
    );
  }

  CustomFlushbar.warning(
    BuildContext context,
    String message, {
    Widget? icon,
    Color? background,
    FlushbarPosition? flushbarPosition,
  }) {
    CustomFlushbar(
      context,
      message,
      background: AppColors.warningColor,
      icon: icon,
      flushbarPosition: flushbarPosition,
    );
  }

  CustomFlushbar.info(
    BuildContext context,
    String message, {
    Widget? icon,
    Color? background,
    FlushbarPosition? flushbarPosition,
  }) {
    CustomFlushbar(
      context,
      message,
      background: AppColors.primaryColor,
      icon: icon,
      flushbarPosition: flushbarPosition,
    );
  }
}
