import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AppSnackbar {
  static void showSuccess(BuildContext context, String message,
      {FlushbarPosition? position}) {
    _showFlushbarBase(
      context,
      message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
      position: position,
    );
  }

  static void showError(BuildContext context, String message,
      {FlushbarPosition? position}) {
    _showFlushbarBase(
      context,
      message,
      backgroundColor: Colors.red,
      icon: Icons.error,
      position: position,
    );
  }

  static void showInfo(BuildContext context, String message,
      {FlushbarPosition? position}) {
    _showFlushbarBase(
      context,
      message,
      backgroundColor: Colors.blue,
      icon: Icons.info,
      position: position,
    );
  }

  static void _showFlushbarBase(
    BuildContext context,
    String message, {
    required Color backgroundColor,
    required IconData icon,
    FlushbarPosition? position,
  }) {
    Flushbar(
      message: message,
      icon: Icon(
        icon,
        size: 28.0,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: backgroundColor,
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: position ?? FlushbarPosition.BOTTOM,
      margin: const EdgeInsets.all(8.0),
      borderRadius: BorderRadius.circular(8.0),
    ).show(context);
  }
}
