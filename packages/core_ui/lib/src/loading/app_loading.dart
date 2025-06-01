import 'package:flutter/material.dart';

class AppLoading {
  static Widget base({Color? color, double? size}) {
    return Center(
      child: SizedBox(
        height: size ?? 30,
        width: size ?? 30,
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.white),
        ),
      ),
    );
  }

  static void showLoadingBase(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black54,
          body: base(),
        );
      },
    );
  }

  static void closeLoadingBase(BuildContext context) {
    Navigator.of(context).pop();
  }
}
